json.array! @orders do |order|
  json.id order.id
  json.order_date order.order_date
  json.status order.status
  json.client_id order.client_id
  json.dish_id order.dish_id
end
