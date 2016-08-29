require 'openssl'

class User < ActiveRecord::Base

  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new

  before_validation :downcase_username
  before_validation :downcase_email

  has_many :questions

  validates :username, presence: true, length: {maximum: 40}, :format => {:with => /\A[a-zA-Z0-9_]+\z/}, uniqueness: {case_sensitive: false}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}

  attr_accessor :password

  validates_presence_of :password, on: :create
  validates_confirmation_of :password

  before_save :encrypt_password

  def downcase_username
    self.username = username.downcase
  end

  def downcase_email
    self.email = email.downcase
  end

  def encrypt_password
    if self.password.present?
      #создаем т. н. "соль" - рандомная строка
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))

      #создаем хэш пароля - длинная уникальная строка, из которой невозможно восстановить исходный пароль
      self.password_hash = User.hash_to_string(
          OpenSSL::PKCS5.pbkdf2_hmac(self.password, self.password_salt, ITERATIONS, DIGEST.length, DIGEST)
      )
    end
  end

  # служебный метод, преобразующий бинарную строку в 16-ричный формат, для удобства хранения
  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email) # сперва находим кандидата по email

    if user.present? && user.password_hash == User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST))
      user
    else
      nil
    end
  end
end
