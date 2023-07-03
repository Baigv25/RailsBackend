class Client < ApplicationRecord
    has_many :orders
    enum status_client: { active: 0, inactive: 1}
end
