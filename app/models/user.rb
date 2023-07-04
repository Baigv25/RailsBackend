class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :email, presence: true
    validates :user_name, uniqueness: true
    #validates :encrypted_password, length: { minimum: 4 }
    enum user_type: { administrator: 0, kitchen_user: 1} 
end
