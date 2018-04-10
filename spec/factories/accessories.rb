FactoryBot.define do
  factory :accessory, class: Accessory do
    title "Gear"
    price "9.99"
    image "MyString"
  end
  factory :accessory_2, class: Accessory do
    title "Chain"
    price "9.99"
    image "MyString"
  end
end
