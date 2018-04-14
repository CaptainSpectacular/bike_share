require 'rails_helper'

describe 'admin visits admin bike new path' do
  scenario 'they create a new accessory' do
    admin = create(:admin)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit '/admin/bike-shop/new'

    click_on "Create Accessory"
    fill_in "accessory[title]", with: "Backpack"
    fill_in "accessory[description]", with: "A really great backpack"
    fill_in "accessory[price]", with: 50.0
    fill_in "accessory[image]", with: "https://static.shoplightspeed.com/shops/611769/files/005532421/150x150x1/kestrel-talon-x-105-triathlon-bike.jpg"
    fill_in "accessory[status]", with: " active"
  end
end
