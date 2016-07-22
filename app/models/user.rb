require 'bcrypt'
class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posts
  has_many :comments

  include BCrypt
  validates :username, presence: true
  validates :password_hash, presence: true

  def password
     @password ||= Password.new(password_hash)
  end

  def password=(new_password)
     @password = Password.create(new_password)
     self.password_hash = @password
  end

  def login(password)
      self.password ==password
  end
end
