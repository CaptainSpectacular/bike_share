class Accessory < ApplicationRecord
  validates_presence_of :title, :description, :price
  validates_uniqueness_of :title
  validates_numericality_of :price, greater_than: 0

  has_many :order_accessories
  has_many :orders, through: :order_accessories

  def self.location(accessories_params)
    if accessories_params[:category]
      accessories = Accessory.where(category_id: accessories_params[:category])
    else
      @accessories = Accessory.all
    end
  end

  def order_quantity(order)
    order_accessories.find_by(order: order.id).quantity
  end

  def order_subtotal(order)
    price * order_quantity(order)
  end
end
