json.extract! user, :id, :user_name, :user_password, :user_type, :created_at, :updated_at
json.url user_url(user, format: :json)
