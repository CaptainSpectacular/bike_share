require 'rails_helper'

RSpec.describe Station, type: :model do
  describe 'validations' do
    it{should validate_presence_of :name}
    it{should validate_presence_of :dock_count}
    it{should validate_presence_of :city}
    it{should validate_presence_of :installation_date}
  end

  describe 'relationships' do
    it{should respond_to :trips}
  end

  describe 'class methods' do
    it '.average_docks' do
      create(:station_1, dock_count: 10)
      create(:station_1, dock_count: 2)
      create(:station_1, dock_count: 4)
      create(:station_1, dock_count: 0)
      create(:station_1, dock_count: 4)

      expect(Station.average_bikes).to eq(4)
    end

    it '.least_docks' do
      station = create(:station_1, dock_count: 0)
      create(:station_1, dock_count: 10)
      create(:station_1, dock_count: 2)
      create(:station_1, dock_count: 4)
      create(:station_1, dock_count: 4)

      expect(Station.least_docks).to eq(station)
    end

    it '.most_docks' do
      station = create(:station_1, dock_count: 10)
      create(:station_1, dock_count: 2)
      create(:station_1, dock_count: 4)
      create(:station_1, dock_count: 0)
      create(:station_1, dock_count: 4)

      expect(Station.most_docks).to eq(station)
    end

    it '.min_docks' do
      create(:station_1, dock_count: 10)
      create(:station_1, dock_count: 2)
      create(:station_1, dock_count: 4)
      create(:station_1, dock_count: 0)
      create(:station_1, dock_count: 4)

      expect(Station.min_docks).to eq(0)
    end

    it '.max_docks' do
      create(:station_1, dock_count: 10)
      create(:station_1, dock_count: 2)
      create(:station_1, dock_count: 4)
      create(:station_1, dock_count: 0)
      create(:station_1, dock_count: 4)

      expect(Station.max_docks).to eq(10)
    end

    it '.newest' do
      station = create(:station_1, installation_date: Time.now)
      create(:station_1, installation_date: Time.now - 10)
      create(:station_1, installation_date: Time.now - 20)
      create(:station_1, installation_date: Time.now - 30)
      create(:station_1, installation_date: Time.now - 40)

      expect(Station.newest).to eq(station)
    end

    it '.oldest' do
      station = create(:station_1, installation_date: Time.now)
      create(:station_1, installation_date: Time.now + 10)
      create(:station_1, installation_date: Time.now + 20)
      create(:station_1, installation_date: Time.now + 30)
      create(:station_1, installation_date: Time.now + 40)

      expect(Station.oldest).to eq(station)
    end
  end

  describe 'instance methods' do
    it '.started_rides' do
      station = create(:station_1)
      create(:trip, start_station_id: station.id)
      create(:trip, start_station_id: station.id)
      create(:trip, start_station_id: station.id)
      create(:trip, start_station_id: station.id)
      create(:trip, start_station_id: station.id)
  
      expect(station.ended_rides).to eq(5)
    end

    it '.ended_rides' do
      station = create(:station_1)
      create(:trip, end_station_id: station.id)
      create(:trip, end_station_id: station.id)
      create(:trip, end_station_id: station.id)
      create(:trip, end_station_id: station.id)
      create(:trip, end_station_id: station.id)
      create(:trip, end_station_id: station.id)

      expect(station.ended_rides).to eq(6)
    end

    it '.frequent_destination' do
      station1 = create(:station_1)
      station2 = create(:station_2)
      station3 = create(:station_1)
      create(:trip, start_station_id: station1.id, end_station_id: station2.id)
      create(:trip, start_station_id: station1.id, end_station_id: station2.id)
      create(:trip, start_station_id: station1.id, end_station_id: station2.id)
      create(:trip, start_station_id: station1.id, end_station_id: station3.id)
      create(:trip, start_station_id: station1.id, end_station_id: station3.id)

      expect(station1.frequent_destination).to eq(station2)
    end

    it '.frequent_origin' do
      station1 = create(:station_1)
      station2 = create(:station_2)
      station3 = create(:station_1)
      create(:trip, start_station_id: station1.id, end_station_id: station2.id)
      create(:trip, start_station_id: station1.id, end_station_id: station2.id)
      create(:trip, start_station_id: station1.id, end_station_id: station2.id)
      create(:trip, start_station_id: station3.id, end_station_id: station2.id)
      create(:trip, start_station_id: station3.id, end_station_id: station2.id)

      expect(station2.frequent_origin).to eq(station1)
    end

    it '.most_trips_started' do
      station = create(:station_1)
      create(:trip, start_station_id: station.id, start_date: Date.today - 1000000)
      create(:trip, start_station_id: station.id, start_date: Date.today - 1000000)
      create(:trip, start_station_id: station.id, start_date: Date.today - 1000000)
      create(:trip, start_station_id: station.id, start_date: Date.today)
      create(:trip, start_station_id: station.id, start_date: Date.today)  

      expect(station.most_trips_started).to eq(Date.today - 1000000)
    end

    it '.most_used_zip' do
      station = create(:station_1)
      create(:trip, start_station_id: station.id, zip_code: 80221)
      create(:trip, start_station_id: station.id, zip_code: 80221)
      create(:trip, start_station_id: station.id, zip_code: 80221)
      create(:trip, start_station_id: station.id, zip_code: 76482)
      create(:trip, start_station_id: station.id, zip_code: 89283)  

      expect(station.most_used_zip).to eq(80221)
    end

    it '.most_used_bike' do
      station = create(:station_1)
      create(:trip, start_station_id: station.id, bike_id: 2)
      create(:trip, start_station_id: station.id, bike_id: 2)
      create(:trip, start_station_id: station.id, bike_id: 5)
      create(:trip, start_station_id: station.id, bike_id: 1)
      create(:trip, start_station_id: station.id, bike_id: 3)    

      expect(station.most_used_bike).to eq(2)
    end
  end
end
