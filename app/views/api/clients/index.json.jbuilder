json.array! @clients do |client|
    json.id client.id
    json.client_name client.client_name
    json.email client.email
    json.client_password client.client_password
    json.direction client.direction
    json.status_client client.status_client
end  
