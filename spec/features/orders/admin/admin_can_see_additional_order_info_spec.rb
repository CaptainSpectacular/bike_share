require 'rails_helper'

describe 'As an admin' do
  describe 'when I visit an individual order page' do
    it 'shows information about that order, including purchaser info' do
      admin = create(:admin)
      user = create(:user)
      order = user.orders.create(status: "ordered", date_time: Time.now, total: 9, user_id: user.id)

      allow_any_instance_of(ApplicationController).to receive(:current_admin).and_return(admin)

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
end
