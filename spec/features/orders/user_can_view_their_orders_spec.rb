require 'rails_helper'

describe 'As a registered user' do
  describe 'when I visit /dashboard and click one of my orders' do
    it 'shows information about that order, including total and status' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      accessory = create(:accessory)
      visit bike_shop_path

      click_on 'Add to Cart'
      click_on 'Checkout'
expect(current_path).to eq(dashboard_path(user))
      click_on '1'

      order = Order.last

      expect(current_path).to eq(order_path(order))

      expect(page).to have_content(order.total)
      expect(page).to have_content(order.status)
      expect(page).to have_content(order.date_time)
      expect(page).to have_content(order.accessories.first.title)
      expect(page).to have_content(order.accessories.first.order_quantity(order))
      expect(page).to have_content(order.accessories.first.order_subtotal(order))
    end
  end

  describe '' do
    it '' do
    end
  end
end
