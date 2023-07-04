class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :email, presence: true
    validates :user_name, uniqueness: true
    enum user_type: { administrator: 0, kitchen_user: 1} 
end
