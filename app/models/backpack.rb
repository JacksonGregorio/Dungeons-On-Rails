class Backpack
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :character
  has_many :items
end
