class Spell
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :type_spell, type: Integer
  field :description, type: String
  field :demage, type: Integer, optional: true
  field :levelcast, type: Integer
  belongs_to :character

  enum type: [:attack, :defense, :heal, :buff, :debuff, :utilities]
end
