require 'bcrypt'

class User < ActiveRecord::Base

  has_many :tweets

  include BCrypt

  def password
    p password_hash
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  validates :username, uniqueness: true
  validates :username, :name, presence: true
end
