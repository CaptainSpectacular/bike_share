require 'rails_helper'

describe 'As a visitor' do
  describe 'when I use my cart' do
    it 'I am redirected to login if I try to checkout my cart' do
      create(:accessory)

      visit '/bike-shop'

      click_on 'Add to Cart'
      visit '/cart'
      click_on 'Checkout'

      expect(current_path).to eq(login_path)
    end

    it 'I cannot view another user\'s private data' do
      user = create(:user)
      create(:accessory)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit bike_shop_path
      click_on 'Add to Cart'
      visit '/cart'
      click_on 'Checkout'
      order = Order.last
      click_on 'Logout'

      visit dashboard_path
      expect(page).to_not have_content("#{order.total}")
      expect(page).to have_content('The page you were looking for doesn\'t exist.')
    end
  end
end
