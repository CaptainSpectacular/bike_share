class Order < ApplicationRecord
  validates_presence_of :date_time, :status, :user_id
  belongs_to :user

  has_many :order_accessories
  has_many :accessories, through: :order_accessories

  def total
    accessories.sum("accessories.price * order_accessories.quantity")
  end

  def self.count_by_status(status)
    where(status: status).size
  end

  def self.by_status(status)
    where(status: status)
  end
end
