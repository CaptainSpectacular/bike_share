require  'rails_helper'

describe 'as a user' do
  scenario 'they can add to cart from accessory show page' do
      accessory = create(:accessory)

      visit accessory_path(accessory)

      click_on "Add to Cart"
      visit '/cart'

      expect(page).to have_content(accessory.title)
      expect(page).to have_content(accessory.price)
  end
end
