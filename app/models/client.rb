class Client < ApplicationRecord
    #attr_accessor :client_name, :email, :client_password, :direction, :status_client
    has_many :orders
    enum status_client: { active: 0, inactive: 1}
end
