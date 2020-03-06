class User < ApplicationRecord
    has_secure_password
    has_many :posts
    has_many :checklist_items
    validates :username, uniqueness: true
end
