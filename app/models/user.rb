class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many :meals, through: :orders

  validates_uniqueness_of :email
  validates_presence_of :first_name, :last_name, :email
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :password, length: { in: 4..20 }

  end
