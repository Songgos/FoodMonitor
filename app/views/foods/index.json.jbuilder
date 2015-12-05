json.array!(@foods) do |food|
  json.extract! food, :id, :name, :description, :properties, :vitamins, :carbs, :fats, :minerals, :proteins
  json.url food_url(food, format: :json)
end
