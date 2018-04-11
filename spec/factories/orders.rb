FactoryBot.define do
  factory :order do
    status "MyString"
    date_time Time.now
    total "9.99"
  end
end
