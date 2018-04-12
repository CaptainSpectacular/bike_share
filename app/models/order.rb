class Order < ApplicationRecord
  validates_presence_of :date_time, :total, :status, :user_id


end
