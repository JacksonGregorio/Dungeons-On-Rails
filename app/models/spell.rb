class Spell
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :type, type: String
  field :description, type: String
  field :demage, type: Integer, optional: true
  field :levelcast, type: Integer
  belongs_to :character
end
