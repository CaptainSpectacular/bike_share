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

      fill_in 'order[purchaser_name]', with: 'Megan Marie'
      fill_in 'order[address]', with: 'JK Street'
      click_on 'Create Order'

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

    it 'does not show me admin info, such as purchaser name and address' do
      user = create(:user)
      accessory = create(:accessory)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit bike_shop_path

      click_on 'Add to Cart'
      click_on 'Checkout'

      fill_in 'order[purchaser_name]', with: 'Megan Marie'
      fill_in 'order[address]', with: 'JK Street'
      click_on 'Create Order'

      order = Order.last
      visit order_path(order)

      expect(page).to_not have_content(order.purchaser_name)
      expect(page).to_not have_content(order.address)
    end

    it 'does not show me another user\'s orders' do
      user = create(:user)
      user2 = create(:user2)
      order = user.orders.create!(attributes_for(:order))
      accessory = create(:accessory)
      order.order_accessories.create!(order_id: order.id, accessory_id: accessory.id, quantity: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user2)

      visit order_path(order)

      expect(page).to have_content("The page you were looking for doesn't exist.")
      expect(page).to_not have_content(order.status)
    end

    it 'shows me a status timestamp if my order was completed or cancelled' do
      admin = create(:admin)
      user = create(:user)
      paid_order = user.orders.create!(attributes_for(:paid_order))

      allow_any_instance_of(ApplicationController).to receive(:current_admin).and_return(admin)
      visit admin_dashboard_path
      click_on 'Mark as Completed'

      visit order_path(paid_order)

      expect(page).to have_content("Completed on #{DateTime.now.strftime("%Y-%m-%d")}")
    end
  end
end
