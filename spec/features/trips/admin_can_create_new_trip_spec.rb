require 'rails_helper'

describe 'As an admin' do
  describe 'when I visit admin trip new' do
    describe 'and I fill in a form correctly' do
      it 'creates a trip, gives a flash message and takes me to show page' do
        admin = create(:admin)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
        visit new_admin_trip_path

        fill_in 'trip[duration]', with: 3
        fill_in 'trip[start_date]', with: '12/16/2018'
        fill_in 'trip[start_station_name]', with: 'Louisiana-Pearl'
        fill_in 'trip[end_date]', with: '12/16/2018'
        fill_in 'trip[end_station_name]', with: 'Louisiana-Pearl'
        fill_in 'trip[bike_id]', with: 2
        fill_in 'trip[subscription_type]', with: 'Customer'
        fill_in 'trip[zip_code]', with: 80218
        click_on 'Create Trip'

        expect(current_path).to eq(trip_path(Trip.last))
        trip.attributes.each_value do |attr|
         expect(page).to have_content(attr)
        end

      end
    end
  end
end
