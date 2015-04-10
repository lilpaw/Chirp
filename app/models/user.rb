require 'bcrypt'

class User < ActiveRecord::Base

  include BCrypt

  def password
    p password_hash
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  # validates :username, uniqueness: true
  # validates :username, :name, presence: true

  has_many :tweets

  has_many :stalker_relationships, class_name: "Relationship", foreign_key: "prey_id"
  has_many :stalkers, class_name: "User", through: :stalker_relationships

  has_many :prey_relationships, class_name: "Relationship", foreign_key: "stalker_id"
  has_many :preys, class_name: "User", through: :prey_relationships
end
