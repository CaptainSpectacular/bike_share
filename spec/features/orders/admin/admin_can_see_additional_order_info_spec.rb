require 'rails_helper'

describe 'As a registered user' do
  describe 'when I visit /dashboard and click one of my orders' do
    it 'shows information about that order, including total and status' do
      user = create(:user)
      order = user.orders.create(:order)

      visit order_path(order)

      expect(page).to have_content(order.date_time)
      expect(page).to have_content(order.purchaser_full_name)
      expect(page).to have_content(order.purchaser_address)
      expect(page).to have_link(order.accessories.first.title)
      expect(page).to have_content(order.accessories.first.order_quantity(order))
      expect(page).to have_content(order.accessories.first.order_subtotal(order))
      expect(page).to have_content(order.total)
      expect(page).to have_content(order.status)
    end
  end

  describe '' do
    it '' do
    end
  end
end
