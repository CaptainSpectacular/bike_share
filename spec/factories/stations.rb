FactoryBot.define do
  factory :station_1, class: Station do
    name "Broadway"
    dock_count 1
    city "MyString"
    installation_date "3018-04-09"
  end
  factory :station_2, class: Station do
    name "Station2"
    dock_count 2
    city "Denver"
    installation_date "2018-05-09"
  end
end
