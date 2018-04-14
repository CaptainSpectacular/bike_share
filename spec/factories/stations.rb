FactoryBot.define do
  factory :station_1, class: Station do
    name "Broadway"
    dock_count 111
    city "MyString"
    installation_date Time.now
  end
  
  factory :station_2, class: Station do
    name "Station2"
    dock_count 333
    city "Denver"
    installation_date Time.now + 10000000
  end
end
