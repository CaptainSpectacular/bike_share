require 'rails_helper'

describe 'user visits an accessory show page' do
  scenario "it sees all the accessory's information" do
    accessory = create(:accessory)

    visit "/accessory/#{accessory.id}"

    expect(page).to have_content(accessory.title)
    expect(page).to have_content(accessory.price)
    expect(page).to have_css("img[src*='http://my_string.com/something.png']")

    click_on "Add to Cart"
    expect(current_path).to eq('/cart')
  end
  scenario "it sees a retired accessories information" do
    accessory = create(:accessory_2)

    visit accessory_path(accessory)

    expect(page).to have_content(accessory.title)
    expect(page).to have_content(accessory.price)
    expect(page).to have_css("img[src*='http://my_string.com/something.png']")

    expect(page).to have_content("Sorry, Accessory is Retired!")
    expect(page).to_not have_content("Add to Cart")
  end
end
