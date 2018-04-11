require 'rails_helper'

describe 'As an admin' do
  describe 'when I visit admin trip new' do
    describe 'and I fill in a form correctly' do
      it 'creates a trip, gives a flash message and takes me to show page' do
        admin = create(:admin)
        station = Station.create!(name: 'Louisiana-Pearl', dock_count: 45, installation_date: '12/16/2017', city: 'Denver')

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit new_admin_trip_path
        fill_in 'trip[duration]', with: 3
        fill_in 'trip[start_date]', with: '12/16/2018'
        select station.name, from: 'trip[start_station_id]'
        fill_in 'trip[end_date]', with: '12/16/2018'
        select station.name, from: 'trip[end_station_id]'
        fill_in 'trip[bike_id]', with: 2
        select 'Customer', from: 'trip[subscription_type]'
        fill_in 'trip[zip_code]', with: 80218
        click_on 'Create Trip'

        trip = Trip.last
        expect(current_path).to eq(trip_path(trip))
        expect(page).to have_content(trip.duration)
        expect(page).to have_content(trip.start_date)
        expect(page).to have_content(trip.start_station_name)
        expect(page).to have_content(trip.end_date)
        expect(page).to have_content(trip.end_station_name)
        expect(page).to have_content(trip.bike_id)
        expect(page).to have_content(trip.subscription_type)
        expect(page).to have_content(trip.zip_code)
      end
    end
  end
end
