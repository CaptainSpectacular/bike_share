require 'rails_helper'

describe 'Trip show' do
  describe 'user visits a trip show page' do
    it 'shows all the attributes of that trip' do
      trip = create(:trip)
      trip2 = create(:trip)

      visit trip_path(trip)

      expect(page).to have_content(trip.duration)
      expect(page).to have_content(trip.start_date)
      expect(page).to have_content(trip.start_station_name)
      expect(page).to have_content(trip.end_date)
      expect(page).to have_content(trip.end_station_name)
      expect(page).to have_content(trip.bike_id)
      expect(page).to have_content(trip.subscription_type)
      expect(page).to have_content(trip.zipcode)
      expect(page).to_not have_content(trip2.duration)
    end
  end
end
