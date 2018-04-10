FactoryBot.define do
  factory :trip do
    sequence(:duration) {|n| 1 + n }
    start_date "MyString"
    start_station_name "MyString"
    start_station_id 1
    end_date "MyString"
    end_station_name "MyString"
    end_station_id 1
    bike_id 1
    subscription_type "MyString"
    zip_code 1
  end
end
