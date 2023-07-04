json.extract! user, :id, :user_name, :encrypted_password, :user_type, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
