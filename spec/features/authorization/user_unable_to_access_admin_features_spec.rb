require 'rails_helper'

describe 'As a regular user' do
  it 'I can\'t visit the admin dashboard' do
    admin = create(:admin)
    user = create(:user)
    order = user.orders.create!(attributes_for(:order))
    order2 = user.orders.create!(attributes_for(:order))
    order3 = user.orders.create!(attributes_for(:order))

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_dashboard_path
    expect(page).to have_content('The page you were looking for doesn\'t exist.')
    visit admin_bike_shop_path
    expect(page).to have_content('The page you were looking for doesn\'t exist.')
    visit new_admin_condition_path
    expect(page).to have_content('The page you were looking for doesn\'t exist.')
  end
end
