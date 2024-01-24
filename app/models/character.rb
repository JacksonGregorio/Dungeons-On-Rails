class Character
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String, optional: false 
  field :lifepoints , type: Integer, optional: false, default: 10
  field :strength, type: Integer,  optional: false, default: 10
  field :intelligence, type: Integer, optional: false, default: 10
  field :dexterity, type: Integer, optional: false, default: 10
  field :wisdom, type: Integer, optional: false, default: 10
  field :constitution, type: Integer, optional: false, default: 10
  field :charisma, type: Integer, optional: false, default: 10
  field :level, type: Integer , optional: false, default: 1
  field :armor_id, type: BSON::ObjectId , optional: true
  field :weapon_id, type: BSON::ObjectId, optional: true
  field :helmet_id, type: BSON::ObjectId, optional: true
  field :shield_id, type: BSON::ObjectId, optional: true
  field :boots_id, type: BSON::ObjectId, optional: true
  field :gloves_id, type: BSON::ObjectId, optional: true
  belongs_to :player, optional: false
  has_one :backpack,
  has_many :abilities
  has_many :items, through: :backpack
end
