require 'rails_helper'

describe 'As an admin' do
  describe 'when I visit admin trip edit' do
    describe 'and I fill in a form correctly' do
      it 'updates that trip, shows a flash message' do
        admin = create(:admin)
        trip = create(:trip)
        station2 = Station.create!(name: 'Louisiana-Pearl', dock_count: 45, installation_date: Time.now, city: 'Denver')

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit edit_admin_trip_path(trip)

        fill_in 'trip[duration]', with: 3
        fill_in 'trip[start_date]', with: Time.now
        select station2.name, from: 'trip[start_station_id]'
        fill_in 'trip[end_date]', with: Time.now
        select station2.name, from: 'trip[end_station_id]'
        fill_in 'trip[bike_id]', with: 2
        select 'Customer', from: 'trip[subscription_type]'
        fill_in 'trip[zip_code]', with: 80218
        click_on 'Update Trip'

        expect(current_path).to eq(trip_path(trip))
        expect(page).to have_content("Your trip from #{trip.start_date} was updated!")
        expect(page).to have_content('3')
        expect(page).to have_content(trip.start_date)
        expect(page).to have_content('Louisiana-Pearl')
        expect(page).to have_content(trip.end_date)
        expect(page).to have_content('Louisiana-Pearl')
        expect(page).to have_content('2')
        expect(page).to have_content('Customer')
        expect(page).to have_content('80218')
      end
    end
  end
end
