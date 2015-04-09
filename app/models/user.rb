require 'bcrypt'

class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  validates :username, uniqueness: true
  validates :username, :name, presence: true
end
