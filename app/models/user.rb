class User < ApplicationRecord

  validates :email ,presence: true ,uniqueness: true
  validates :name ,presence:  true, uniqueness: true

  has_many :messages
  has_secure_password
end
