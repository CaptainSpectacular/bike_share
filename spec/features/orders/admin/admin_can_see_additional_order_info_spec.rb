require 'rails_helper'

describe 'As an admin' do
  describe 'when I visit an individual order page' do
    it 'shows information about that order, including purchaser info' do
      admin = create(:admin)
      user = create(:user)
      order = user.orders.create!(attributes_for(:order))
      accessory = create(:accessory)
      order.order_accessories.create!(order_id: order.id, accessory_id: accessory.id, quantity: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_admin).and_return(admin)

      visit order_path(order)
save_and_open_page
      expect(page).to have_content(order.date_time)
      expect(page).to have_content(order.purchaser_name)
      expect(page).to have_content(order.address)
      expect(page).to have_link(order.accessories.first.title)
      expect(page).to have_content(order.accessories.first.order_quantity(order))
      expect(page).to have_content(order.accessories.first.order_subtotal(order))
      expect(page).to have_content(order.total)
      expect(page).to have_content(order.status)
    end
  end
end
