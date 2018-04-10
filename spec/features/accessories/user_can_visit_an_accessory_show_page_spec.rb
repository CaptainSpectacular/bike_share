require 'rails_helper'

describe 'user visits an accessory show page' do
  scenario "it sees all the accessory's information" do
    accessory = create(:accessory)

    visit accessory_path(accessory)

    expect(page).to have_content(accessory.title)
    expect(page).to have_content(accessory.price)
    expect(page).to have_content(accessory.image)
  end
end
