json.user do |user|
  json.id @user.id
  json.user_name @user.user_name
  json.password @user.password
  json.user_type @user.user_type
end
