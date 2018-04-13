FactoryBot.define do
  factory :order do
    status "MyString"
    date_time Time.now
    total "9.99"
    user_id 1
  end
end
