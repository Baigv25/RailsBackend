json.extract! dish, :id, :name, :description, :price, :picture, :created_at, :updated_at
json.url dish_url(dish, format: :json)
