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

      visit order_path(order)

      expect(page).to have_link(order.id)
      expect(page).to have_link(order2.id)
      expect(page).to have_link(order3.id)
    end

    it 'I see total number of orders for each status' do
      admin = create(:admin)
      user = create(:user)
      paid_order = user.orders.create!(attributes_for(:paid_order))
      orderered_order = user.orders.create!(attributes_for(:orderered_order))
      cancelled_order = user.orders.create!(attributes_for(:cancelled_order))
      completed_order = user.orders.create!(attributes_for(:completed_order))

      allow_any_instance_of(ApplicationController).to receive(:current_admin).and_return(admin)

      visit order_path(order)

      expect(page).to have_content('Paid orders: 1')
      expect(page).to have_content('In process orders: 1')
      expect(page).to have_content('Cancelled orders: 1')
      expect(page).to have_content('Completed orders: 1')
    end


  end
end
