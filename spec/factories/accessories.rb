FactoryBot.define do
  factory :accessory, class: Accessory do
    id 1
    title "Gear"
    price "9.99"
    image "http://my_string.com/something.png"
    status "active"
  end
  factory :accessory_2, class: Accessory do
    id 2
    title "Chain"
    price "9.99"
    image "http://my_string.com/something.png"
    status "inactive"
  end
end
