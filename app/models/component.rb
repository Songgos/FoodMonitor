class Component < ActiveRecord::Base
  has_many :foods, through: :foods_data
  belongs_to :component_types, foreign_key: "component_type_id"
end
