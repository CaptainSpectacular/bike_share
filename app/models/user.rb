class User < ApplicationRecord
  validates_presence_of :username, :password, :role
  has_secure_password
end
