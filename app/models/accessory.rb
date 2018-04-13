class Accessory < ApplicationRecord
  validates_presence_of :title, :price, :image
  validates_uniqueness_of :title
  validates_numericality_of :price, greater_than: 0
end
