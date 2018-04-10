require 'rails_helper'

describe 'as a visitor' do
  scenario 'visits cart and sees all items they added' do
    accessory_1 = create(:accessory)

    visit '/bike-shop'

    click_on 'Add to Cart'

    visit '/cart'

    expect(page).to have_content(accessory_1.title)
    expect(page).to have_content(accessory_1.price)
    expect(page).to have_content(accessory_1.image)
  end
end
