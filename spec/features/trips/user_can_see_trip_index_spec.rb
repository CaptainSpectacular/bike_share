require 'rails_helper'

describe 'Trip Index' do
  describe 'user visits trip index page' do
    it 'shows the first 30 trips and all their attributes' do
      trip1, trip2, trip3, trip4, trip5, trip6, trip7, trip8, trip9, trip10,
      trip11, trip12, trip13, trip14, trip15, trip16, trip17, trip18, trip19,
      trip20, trip21, trip22, trip23, trip24, trip25, trip26, trip27, trip28,
      trip29, trip30, trip31 = create_list(:trip, 31)

      visit trips_path

      expect(page).to have_content(trip1.duration)
      expect(page).to have_content(trip1.start_date)
      expect(page).to have_content(trip1.start_station_name)
      expect(page).to have_content(trip1.end_date)
      expect(page).to have_content(trip1.end_station_name)
      expect(page).to have_content(trip1.bike_id)
      expect(page).to have_content(trip1.subscription_type)
      expect(page).to have_content(trip1.zip_code)
      expect(page).to have_content(trip30.duration)
      expect(page).to_not have_content(trip31.duration)
    end

    it 'shows a button to see more pages of trips' do
      trips = create_list(:trip, 31)

      visit trips_path

      expect(page).to have_link('Next')
    end
  end

  describe 'user visits second trip index page' do
    it 'shows 30 more trips and buttons to move forward and backward' do
      trips = create_list(:trip, 61)

      visit '/trips?page=2'

      expect(page).to have_link('Previous')
      expect(page).to have_link('Next')
    end
  end
end
