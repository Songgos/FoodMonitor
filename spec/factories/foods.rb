FactoryGirl.define do
  factory :food do
    id 1
    name "FoodName1"
    description "FoodDescription1"
    properties "FoodProperties1"
  end

  factory :foods_datum do
    id 1
    percentage 10.0
    food_id 1
    component_id 1
  end

  factory :component do
    id 1
    name "B1"
    component_type_id 1
  end

  factory :component_type do
    id 1
    name "Vitamin"
  end
end
