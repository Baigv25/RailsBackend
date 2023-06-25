json.order do
  json.id @order.id
  json.order_date @order.order_date
  json.status @order.status
  json.client_id @order.client_id
  json.plate_id @order.plate_id
end
