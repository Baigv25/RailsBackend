json.user do |user|
  json.id @user.id
  json.user_name @user.user_name
  json.encrypted_password @user.encrypted_password
  json.user_type @user.user_type
  json.email @user.email
end
