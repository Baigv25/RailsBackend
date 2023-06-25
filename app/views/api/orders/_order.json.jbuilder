json.extract! order, :id, :order_date, client_id, plate_id , :status, :created_at, :updated_at
json.url order_url(order, format: :json)
