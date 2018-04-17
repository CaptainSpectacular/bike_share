require 'rails_helper'

describe 'an admin/registered user' do
  describe 'visits the dashboard' do
    it 'see weather on day with highest rides' do
      condition = create(:con1)
      trip      = create(:trip, condition: condition)

      visit trips_dashboard_path

      expect(page).to have_content(Trip.best_weather)
    end

    it 'see weather on day with lowest rides' do
      condition = create(:con2)
      trip      = create(:trip, condition: condition)

      visit trips_dashboard_path

      expect(page).to have_content(Trip.worst_weather)
    end

    it 'see average trip duration' do
      condition = create(:con2)
      trip      = create(:trip, condition: condition)

      visit trips_dashboard_path

      expect(page).to have_content(Trip.average_duration)
    end

    it 'see min and max trip duration' do
      condition  = create(:con2)
      trip1      = create(:trip, condition: condition, duration: 19)
      trip2      = create(:trip, condition: condition, duration: 90)

      visit trips_dashboard_path

      expect(page).to have_content(Trip.min_duration)
      expect(page).to have_content(Trip.max_duration)
    end

    it 'see trips by month by year' do
      condition  = create(:con2)
      create(:trip, condition: condition, start_date: Time.parse('2012-4-1'))
      create(:trip, condition: condition, start_date: Time.parse('2012-4-1'))
      create(:trip, condition: condition, start_date: Time.parse('2012-5-1'))
      create(:trip, condition: condition, start_date: Time.parse('2012-5-1'))
      create(:trip, condition: condition, start_date: Time.parse('2012-6-1'))

      visit trips_dashboard_path

      expect(page).to have_content('2012-04: 2')
    end

    it 'see most and least popular station' do
      station_1 = create(:station_1)
      station_2 = create(:station_2)
      condition  = create(:con2)
      create(:trip, condition: condition, start_station: station_1, end_station: station_2)
      create(:trip, condition: condition, start_station: station_1, end_station: station_2)
      create(:trip, condition: condition, start_station: station_1, end_station: station_2)
      create(:trip, condition: condition, start_station: station_1, end_station: station_2)
      create(:trip, condition: condition, start_station: station_1, end_station: station_2)

      visit trips_dashboard_path

      expect(page).to have_content("Most Popular Starting Station: #{station_1.name}")
      expect(page).to have_content("Most Popular Ending Station: #{station_2.name}")
    end

    it 'see the most and least popular bike' do
      condition  = create(:con2)
      create(:trip, bike_id: 1, condition: condition )
      create(:trip, bike_id: 1, condition: condition )
      create(:trip, bike_id: 2, condition: condition )

      visit trips_dashboard_path

      expect(page).to have_content("Most Popular Bike: #{Trip.popular_bike[0]} with #{Trip.popular_bike[1]} rides")
      expect(page).to have_content("Least Popular Bike: #{Trip.unpopular_bike[0]} with #{Trip.unpopular_bike[1]} rides")
    end

    it 'see the subscription breakdown' do
      condition  = create(:con2)
      create(:trip, bike_id: 1, condition: condition, subscription_type: 'Subscriber')
      create(:trip, bike_id: 1, condition: condition, subscription_type: 'Customer')
      create(:trip, bike_id: 2, condition: condition, subscription_type: 'Customer')

      visit trips_dashboard_path

      expect(page).to have_content("Number of Subscribers: 1 Percentage of Subscribers: 33%")
      expect(page).to have_content("Customers: Number of Customers: 2 Percentage of Customers: 66%")
    end

    it 'see the most/least busy dates' do
      condition  = create(:con2)
      create(:trip, bike_id: 1, condition: condition)
      create(:trip, bike_id: 1, condition: condition)
      create(:trip, bike_id: 2, condition: condition)

      visit trips_dashboard_path

      expect(page).to have_content("Number of Rides: 3")
      expect(page).to have_content("Number of Rides: 3")
    end
  end
end
