class Character
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :lifepoints , type: Integer
  field :strength, type: Integer
  field :intelligence, type: Integer
  field :dexterity, type: Integer
  field :wisdom, type: Integer
  field :constitution, type: Integer
  field :charisma, type: Integer
  field :level, type: Integer
  field :armor_id, type: BSON::ObjectId
  field :weapon_id, type: BSON::ObjectId
  field :helmet_id, type: BSON::ObjectId
  field :shield_id, type: BSON::ObjectId
  field :boots_id, type: BSON::ObjectId
  field :gloves_id, type: BSON::ObjectId
  belongs_to :player
  has_one :backpack
  has_many :abilities
  has_many :items, through: :backpack
end
