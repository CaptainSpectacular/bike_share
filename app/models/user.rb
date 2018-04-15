class User < ApplicationRecord
  validates_presence_of :username, :role
  validates_presence_of :password, confirmation: true
  has_secure_password
  enum role: %w(visitor registered admin)
  has_many :orders
end
