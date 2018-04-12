require 'rails_helper'
# I do not see the order of another user.
#
# If the order was completed or cancelled,
# I see a timestamp when the action took place.

describe 'As a registered user' do
  describe 'when I visit /dashboard and click one of my orders' do
    it 'shows information about that order, including total and status' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      accessory2 = create(:accessory_2)
      visit bike_shop_path
      click_on "Add to Cart"
      click_on 'Checkout'

      click_on order.id

      expect(current_path).to eq(order_path(order))
      expect(page).to have_content(order.items)
      expect(page).to have_content(order.items.first.subtotal)
      expect(page).to have_content(order.items.first.quantity)
      expect(page).to have_content(order.total)
      expect(page).to have_content(order.status)
      expect(page).to have_content(order.datetime_submit)
    end
  end
end
