class Order < ApplicationRecord
  validates_presence_of :date_time, :total, :status
end
