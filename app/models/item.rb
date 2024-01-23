class Item
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :type, type: String
  field :description, type: String
  field :value, type: Integer
  field :demage, type: Integer
  field :effect, type: String
  belongs_to :backpack
end
