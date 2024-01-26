class Character
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name_character, type: String
  field :lifepoints , type: Integer, default: 10
  field :strength, type: Integer,  default: 10
  field :intelligence, type: Integer, default: 10
  field :dexterity, type: Integer, default: 10
  field :wisdom, type: Integer, default: 10
  field :constitution, type: Integer, default: 10
  field :charisma, type: Integer, default: 10
  field :level, type: Integer , default: 1
  field :armor_id, type: BSON::ObjectId 
  field :weapon_id, type: BSON::ObjectId
  field :helmet_id, type: BSON::ObjectId
  field :shield_id, type: BSON::ObjectId
  field :boots_id, type: BSON::ObjectId
  field :gloves_id, type: BSON::ObjectId
  belongs_to :player
  has_one :backpack
  has_many :abilities
end
