class FoodsDatum < ActiveRecord::Base
  belongs_to :foods, foreign_key: "food_id" 
  belongs_to :components, foreign_key: "component_id"
end
