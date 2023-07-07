json.array! @orders do |order|
  json.id order.id
  json.order_date order.order_date
  json.status order.status
  json.dish do
    json.name order.dish.name
  end
  json.client do
    json.client_name order.client.client_name
  end
end