FactoryBot.define do
  factory :order do
    status "MyString"
    date_time Time.now
    user_id 1
  end
end
