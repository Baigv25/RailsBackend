json.extract! client, :id, :name, :email, :password, :direction, :created_at, :updated_at
json.url client_url(client, format: :json)
