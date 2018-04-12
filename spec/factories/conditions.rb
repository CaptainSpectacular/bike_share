FactoryBot.define do
  factory :con1, class: Condition do
    date Time.now
    max_temp 1.5
    average_temp 1.5
    min_temp 1.5
    average_humidity 1.5
    average_visibility 1.5
    average_windspeed 1.5
    precipitation 1.5
  end

  factory :con2, class: Condition do
    date Time.now
    max_temp 2.0
    average_temp 2.0
    min_temp 2.0
    average_humidity 2.0
    average_visibility 2.0
    average_windspeed 2.0
    precipitation 2.0
  end
end
