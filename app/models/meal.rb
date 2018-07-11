class Meal < ApplicationRecord
  has_many :orders
  has_many :users, through: :orders
  validates :name, :description, :price, presence: true
end
