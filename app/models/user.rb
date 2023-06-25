class User < ApplicationRecord
    has_secure_password
    validates :user_name, presence: true
    validates :user_name, uniqueness: true
    validates :user_name, length: { minimum: 4 }
    validates :user_password, length: { minimum: 4 }
    enum user_type: { administrator: 0, kitchen_user: 1} 
end
