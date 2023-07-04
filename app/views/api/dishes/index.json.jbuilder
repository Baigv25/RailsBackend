json.array! @dishes do |dish|
    json.id dish.id
    json.name dish.name
    json.description dish.description
    json.price dish.price
    json.picture dish.picture
    json.status_dish dish.status_dish

end  
