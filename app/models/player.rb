class Player
  include Mongoid::Document
  include Mongoid::Timestamps
  field :username, type: String
  field :email, type: String
  field :password, type: String
  field :premium, type: Mongoid::Boolean
  has_many :characters
end
