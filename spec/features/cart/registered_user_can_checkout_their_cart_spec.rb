require 'rails_helper'

describe 'As a registered user' do
  describe 'when I visit /cart' do
    it 'I see accessory attributes, subtotal and quantity, and cart total' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      accessory = create(:accessory)

      visit bike_shop_path

      click_on 'Add to Cart'
      visit '/cart'

      expect(page).to have_content("Cart: 1")
      expect(page).to have_content("Quantity: 1")
      expect(page).to have_content("Subtotal: 9.99")
      expect(page).to have_content("Total: 9.99")

    end

    it 'I see a button to checkout' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      accessory = create(:accessory)

      visit bike_shop_path

      click_on 'Add to Cart'
      visit '/cart'

      expect(page).to have_link('Checkout')
    end
  end
end