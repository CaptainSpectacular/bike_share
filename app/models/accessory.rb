class Accessory < ApplicationRecord
  validates_presence_of :title, :price, :image

  has_many :order_accessories
  has_many :orders, through: :order_accessories

  def order_quantity(order)
    order_accessories
    .where("order_accessories.order_id = #{order.id}")
    .take
    .quantity
  end

  def order_subtotal(order)
    select("order_accesssories.quantity * accessories.price AS subtotal")
    .where("order_accessories.order_id = #{order.id}")
    .take
    .subtotal
  end
end
