class FoodsDatum < ActiveRecord::Base
  belongs_to :foods
  belongs_to :components
end
