json.dish do
    json.id @dish.id
    json.name @dish.name
    json.description @dish.description
    json.price @dish.price
    json.picture_url (url_for(dish.picture) if @dish.picture.attached?) || ''
    json.status_dish @dish.status_dish
end