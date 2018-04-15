require 'rails_helper'

describe 'As an admin' do
  describe 'when I visit my dashboard' do
    it 'I can click cancel on individual orders which are paid or ordered' do
      admin = create(:admin)
      user = create(:user)
      paid_order = user.orders.create!(attributes_for(:paid_order))
      cancelled_order = user.orders.create!(attributes_for(:cancelled_order))
      ordered_order = user.orders.create!(attributes_for(:orderered_order))

      allow_any_instance_of(ApplicationController).to receive(:current_admin).and_return(admin)

      visit admin_dashboard_path

      within("td#order-#{paid_order.id}-options") do
        click_on 'Cancel'
      end

      within("td#order-#{ordered_order.id}-options") do
        click_on 'Cancel'
      end

      expect(user.orders.first.status).to eq('Cancelled')
      expect(user.orders.last.status).to eq('Cancelled')
    end

    it 'I can click on "mark as paid" on orders that are "ordered"' do
      admin = create(:admin)
      user = create(:user)
      orderered_order = user.orders.create!(attributes_for(:orderered_order))

      allow_any_instance_of(ApplicationController).to receive(:current_admin).and_return(admin)

      visit admin_dashboard_path

      click_on 'Mark as Paid'

      expect(user.orders.first.status).to eq('Paid')
    end

    it 'I can click on "mark as completed" on orders that are "paid"' do
      admin = create(:admin)
      user = create(:user)
      paid_order = user.orders.create!(attributes_for(:paid_order))

      allow_any_instance_of(ApplicationController).to receive(:current_admin).and_return(admin)

      visit admin_dashboard_path

      click_on 'Mark as Completed'

      expect(user.orders.first.status).to eq('Completed')
    end
  end
end
