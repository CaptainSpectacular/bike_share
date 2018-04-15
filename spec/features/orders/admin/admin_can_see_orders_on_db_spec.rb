require 'rails_helper'

describe 'As an admin' do
  describe 'when I visit my dashboard' do
    it 'I see a list of all orders' do
      admin = create(:admin)
      user = create(:user)
      order = user.orders.create!(attributes_for(:order))
      order2 = user.orders.create!(attributes_for(:order))
      order3 = user.orders.create!(attributes_for(:order))

      allow_any_instance_of(ApplicationController).to receive(:current_admin).and_return(admin)

      visit admin_dashboard_path

      expect(page).to have_link("Order #{order.id}")
      expect(page).to have_link("Order #{order2.id}")
      expect(page).to have_link("Order #{order3.id}")
    end

    it 'I see total number of orders for each status' do
      admin = create(:admin)
      user = create(:user)
      paid_order = user.orders.create!(attributes_for(:paid_order))
      orderered_order = user.orders.create!(attributes_for(:orderered_order))
      cancelled_order = user.orders.create!(attributes_for(:cancelled_order))
      completed_order = user.orders.create!(attributes_for(:completed_order))

      allow_any_instance_of(ApplicationController).to receive(:current_admin).and_return(admin)

      visit admin_dashboard_path

      expect(page).to have_content('Paid orders: 1')
      expect(page).to have_content('In progress orders: 1')
      expect(page).to have_content('Cancelled orders: 1')
      expect(page).to have_content('Completed orders: 1')
    end

    it 'I can filter orders to display by each status type' do
      admin = create(:admin)
      user = create(:user)
      paid_order = user.orders.create!(attributes_for(:paid_order))
      orderered_order = user.orders.create!(attributes_for(:orderered_order))
      cancelled_order = user.orders.create!(attributes_for(:cancelled_order))
      completed_order = user.orders.create!(attributes_for(:completed_order))

      allow_any_instance_of(ApplicationController).to receive(:current_admin).and_return(admin)

      visit admin_dashboard_path
      click_on 'Paid orders'

      expect(page).to have_content(paid_order.date_time)
      expect(page).to have_content(paid_order.purchaser_name)
      expect(page).to have_content(paid_order.total)

      click_on 'In progress orders'

      expect(page).to have_content(orderered_order.date_time)
      expect(page).to have_content(orderered_order.purchaser_name)
      expect(page).to have_content(orderered_order.total)
    end
  end
end
