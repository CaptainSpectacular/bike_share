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
      order = user.orders.create!(attributes_for(:order))
      accessory = create(:accessory)
      order.order_accessories.create!(order_id: order.id, accessory_id: accessory.id, quantity: 1)

      visit dashboard_path(user)

      expect(page).to_not have_content("#{order.total}")
      expect(page).to have_content('The page you were looking for doesn\'t exist.')
    end
  end
end
