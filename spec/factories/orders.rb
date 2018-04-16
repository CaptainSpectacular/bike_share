FactoryBot.define do
  factory :order do
    status "MyString"
    date_time Time.now
    user_id 1
    purchaser_name "Megan"
    address "my house"
  end
  factory :paid_order, class: Order do
    status "Paid"
    date_time Time.now
    user_id 1
    purchaser_name "Jacob"
    address "Jacob's house"
  end
  factory :orderered_order, class: Order do
    status "Ordered"
    date_time Time.now + 40000
    user_id 1
    purchaser_name "Mike"
    address "Mike's house"
  end
  factory :cancelled_order, class: Order do
    status "Cancelled"
    date_time Time.now
    user_id 1
    purchaser_name "Laura"
    address "Laura's house"
  end
  factory :completed_order, class: Order do
    status "Completed"
    date_time Time.now
    user_id 1
    purchaser_name "Jennifer"
    address "Jennifer's house"
  end
end
