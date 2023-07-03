class Dish < ApplicationRecord
    has_many :orders
    has_one_attached :picture
    has_rich_text :description
    enum status_dish: { active: 0, inactive: 1}
end
