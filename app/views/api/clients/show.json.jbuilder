json.client do
    json.id @client.id
    json.name @client.name
    json.email @client.email
    json.password @client.password
    json.direction @client.direction
end

