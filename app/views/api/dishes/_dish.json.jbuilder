json.extract! dish, :id, :name, :description, :price, :picture, :status_dish, :created_at, :updated_at
json.url plate_url(dish, format: :json)
