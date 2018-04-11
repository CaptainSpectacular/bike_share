FactoryBot.define do
  factory :station_1, class: Station do
    name "Broadway"
    dock_count 1
    city "MyString"
    installation_date Time.now
  end
  factory :station_2, class: Station do
    name "Station2"
    dock_count 3
    city "Denver"
    installation_date Time.now + 10000000
  end
end
