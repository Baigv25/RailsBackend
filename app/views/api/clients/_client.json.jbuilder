json.extract! client, :id, :client_name, :email, :client_password, :direction, :status_client :created_at, :updated_at
json.url client_url(client, format: :json)
