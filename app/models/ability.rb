class Ability
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :type_ability, type: Integer
  field :description, type: String
  field :demage, type: Integer, default: 0
  belongs_to :character

  enum type: [:attack, :defense, :heal, :buff, :debuff, :utilities]
end
