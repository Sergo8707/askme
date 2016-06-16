# (c) goodprogrammer.ru

# Миграция, созданная rails генератором
# rails g migration AddEmailPasswordToUser email:string password_hash:string password_salt:string
class AddEmailPasswordToUser < ActiveRecord::Migration
  def change
    # команды, добавляющие к таблице users поля email, password_hash, password_salt
    add_column :users, :email, :string
    add_column :users, :password_hash, :string
    add_column :users, :password_salt, :string

    # вручную добавленная команда - хотим еще хранить в юзере путь к его аватарке
    add_column :users, :avatar_url, :string
  end
end
