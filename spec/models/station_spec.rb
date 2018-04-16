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
end
