require 'bcrypt'

class Player
  include Mongoid::Document
  include Mongoid::Timestamps
  include BCrypt
  field :username, type: String
  field :email, type: String
  field :password_hash, type: String
  field :premium, type: Mongoid::Boolean
  has_many :characters

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(test_password)
    self.password == test_password
  end
end
