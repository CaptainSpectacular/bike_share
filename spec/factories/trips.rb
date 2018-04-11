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

  factory :trip_999, class: Trip do
    duration 66
    start_date "12/24/1986"
    start_station_name "Colfax"
    start_station_id 1
    end_date "12/24/1986"
    end_station_name "Colfax"
    end_station_id 1
    bike_id 154
    subscription_type "Customer"
    zip_code 80204
  end
  factory :trip_1000, class: Trip do
    duration 34
    start_date "2/12/2004"
    start_station_name "Broadway"
    start_station_id 3
    end_date "2/12/2004"
    end_station_name "Broadway"
    end_station_id 3
    bike_id 2
    subscription_type "Subscriber"
    zip_code 80218
  end
end
