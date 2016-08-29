class Question < ActiveRecord::Base

  belongs_to :user

  validates :text, presence: true, length: {maximum: 255}
  validates :user, presence: true
end