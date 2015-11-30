class Component < ActiveRecord::Base
  has_many :foods, through: :foods_data
  has_many :component_types
end
