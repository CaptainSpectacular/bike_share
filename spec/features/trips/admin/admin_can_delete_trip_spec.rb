require 'rails_helper'

describe 'As an admin' do
  describe 'on the trip index page' do
    it 'I can delete a trip' do
      admin = create(:admin)
      trip1 = create(:trip_999)
      trip1 = create(:trip_1000)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit trips_path

      first('.delete').click

      expect(current_path).to eq(trips_path)

      expect(page).to have_content('Trip successfully deleted.')
      expect(page).to_not have_content(trip1.duration)
      expect(page).to_not have_content(trip1.start_date)
      expect(page).to_not have_content(trip1.start_station_name)
      expect(page).to_not have_content(trip1.end_date)
      expect(page).to_not have_content(trip1.end_station_name)
      expect(page).to_not have_content(trip1.bike_id)
      expect(page).to_not have_content(trip1.subscription_type)
      expect(page).to_not have_content(trip1.zip_code)
      expect(page).to have_content(trip2.duration)
      expect(page).to have_content(trip2.start_date)
      expect(page).to have_content(trip2.start_station_name)
      expect(page).to have_content(trip2.end_date)
      expect(page).to have_content(trip2.end_station_name)
      expect(page).to have_content(trip2.bike_id)
      expect(page).to have_content(trip2.subscription_type)
      expect(page).to have_content(trip2.zip_code)
    end
  end

  describe 'on the trip show page' do
    it 'I can delete a trip' do
      admin = create(:admin)
      trip = create(:trip)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit trip_path(trip)

      click_on 'Delete'

      expect(current_path).to eq(trips_path)
      expect(page).to have_content('Trip successfully deleted.')
    end
  end
end
