class Food < ActiveRecord::Base
  has_many :components, through: :foods_data
end
