class Order < ApplicationRecord
  validates_presence_of :date_time, :total, :status, :user_id
  belongs_to :user

  has_many :order_accessories, class_name: OrderAccessory
  has_many :accessories, through: :order_accessories
end
