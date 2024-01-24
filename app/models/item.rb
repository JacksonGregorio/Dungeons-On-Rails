class Item
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :type, type: String
  field :description, type: String, optional: true
  field :value, type: Integer
  field :demage, type: Integer, optional: true
  field :effect, type: String, optional: true
  belongs_to :backpack

  def checktypeItem?
    if self.type == "weapon"
      return "weapon"
    elsif self.type == "armor"
      return "armor"
    elsif self.type == "shield"
      return "shield"
    elsif self.type == "helmet"
      return "helmet"
    elsif self.type == "boots"
      return "boots"
    elsif self.type == "gloves"
      return "gloves"
    end
  end

end
