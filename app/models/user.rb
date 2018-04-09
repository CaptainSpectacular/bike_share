class User < ApplicationRecord
  validates_presence_of :username, :password, :role
  has_secure_password
  enum role: %w(visitor registered admin)
end
