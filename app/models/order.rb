class Order < ApplicationRecord
    belongs_to :dish
    belongs_to :client
    validates :dish, presence: true
    enum status: { delayed: 0, delivered: 1, in_time: 2, over_time: 3, cancelled: 4}
end
