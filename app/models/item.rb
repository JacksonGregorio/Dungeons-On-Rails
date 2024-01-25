class Item
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :type_item, type: Integer
  field :description, type: String, optional: true
  field :value, type: Integer
  field :demage, type: Integer, optional: true
  field :effect, type: String, optional: true
  belongs_to :backpack

  enum type: [:weapon, :armor, :shield, :helmet, :boots, :gloves, :potion, :utilities]
end
