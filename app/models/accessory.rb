class Accessory < ApplicationRecord
  validates_presence_of :title, :price, :image

  has_many :order_accessories, class_name: OrderAccessory
  has_many :orders, through: :order_accessories
end
