require 'rails_helper'

describe 'user/admin visits' do
  describe 'stations dashboard' do
    it 'see the total count of stations' do
      3.times do 
        create(:station_1)
      end

      visit stations_dashboard_path

      expect(page).to have_content(Station.all.size)
    end

    it 'see average bikes per station' do
      station1 = create(:station_1, dock_count: 4)
      station2 = create(:station_2, dock_count: 8)

      visit stations_dashboard_path

      expect(page).to have_content(Station.average_bikes)
    end

    it 'see station with most bikes' do
      station1 = create(:station_1, dock_count: 4)
      station2 = create(:station_2, dock_count: 8)

      visit stations_dashboard_path

      expect(page).to have_content(Station.most_docks.name)
      expect(page).to have_content(Station.max_docks)
    end

    it 'see station with fewest bikes' do
      station1 = create(:station_1, dock_count: 4)
      station2 = create(:station_2, dock_count: 8)

      visit stations_dashboard_path

      expect(page).to have_content(Station.least_docks.name)
      expect(page).to have_content(Station.min_docks)
    end

    it 'see oldest station' do
      station1 = create(:station_1, installation_date: Time.now + 300000)
      station2 = create(:station_2, installation_date: Time.now)

      visit stations_dashboard_path

      expect(page).to have_content(Station.oldest.installation_date)
      expect(page).to have_content(Station.oldest.name)
    end

    it 'see newest station' do
      station1 = create(:station_1, installation_date: Time.now + 300000)
      station2 = create(:station_2, installation_date: Time.now)

      visit stations_dashboard_path

      expect(page).to have_content(Station.newest.installation_date)
      expect(page).to have_content(Station.newest.name)
    end
  end
end