FactoryBot.define do
  factory :order do
    status "MyString"
    date_time Time.now
    user_id 1
  end
  factory :paid_order do
    status "Paid"
    date_time Time.now
    user_id 1
  end
  factory :orderered_order do
    status "Ordered"
    date_time Time.now
    user_id 1
  end
  factory :cancelled_order do
    status "Cancelled"
    date_time Time.now
    user_id 1
  end
  factory :completed_order do
    status "Completed"
    date_time Time.now
    user_id 1
  end
end
