FactoryBot.define do
  factory :trip do
    sequence(:duration) {|n| 1 + n }
    start_date Time.now
    start_station_name "MyString"
    start_station_id 1
    end_date Time.now
    end_station_name "MyString"
    end_station_id 1
    bike_id 1
    subscription_type "MyString"
    zip_code 1
  end

  factory :trip_999, class: Trip do
    duration 66
    start_date Time.now
    start_station_name "Colfax"
    start_station_id 1
    end_date Time.now
    end_station_name "Colfax"
    end_station_id 1
    bike_id 154
    subscription_type "Customer"
    zip_code 80204
  end
  factory :trip_1000, class: Trip do
    duration 34
    start_date Time.now + 11111111
    start_station_name "Broadway"
    start_station_id 3
    end_date Time.now + 1111111
    end_station_name "Broadway"
    end_station_id 3
    bike_id 2
    subscription_type "Subscriber"
    zip_code 80218
  end
end
