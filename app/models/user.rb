class User < ApplicationRecord

  has_many :carts
  has_many :payments, through: :carts
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
