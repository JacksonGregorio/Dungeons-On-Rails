class Character
  include Mongoid::Document
  include Mongoid::Timestamps
  field :strength, type: Integer
  field :intelligence, type: Integer
  field :dexterity, type: Integer
  field :wisdom, type: Integer
  field :charisma, type: Integer
  field :level, type: Integer
  belongs_to :player
  has_one :backpack
  has_many :abilities
  has_many :items, through: :backpack
end
