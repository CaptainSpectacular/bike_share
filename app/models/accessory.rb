class Accessory < ApplicationRecord
  validates_presence_of :title, :price, :image
end
