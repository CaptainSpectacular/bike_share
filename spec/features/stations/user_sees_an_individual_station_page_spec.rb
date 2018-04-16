require 'rails_helper'

describe 'user visits a stations show page' do
  scenario 'it shows all that stations information' do
    station_1 = create(:station_1)
    station_2 = create(:station_2)

    visit station_path(station_1)

    expect(current_path).to eq('/stations/broadway')
    expect(page).to have_content(station_1.name)
    expect(page).to have_content("#{station_1.dock_count}")
    expect(page).to have_content(station_1.installation_date)
    expect(page).to have_content(station_1.city)
    expect(page).to_not have_content(station_2.name)
    expect(page).to_not have_content("#{station_2.dock_count}")
    expect(page).to_not have_content(station_2.installation_date)
    expect(page).to_not have_content(station_2.city)
  end
  
  scenario 'it shows the number of rides started at it' do
    station = create(:station_1)
    create(:trip, start_station_id: station.id)
    create(:trip, start_station_id: station.id)
    create(:trip, start_station_id: station.id)
    create(:trip, start_station_id: station.id)
    create(:trip, start_station_id: station.id)
    create(:trip, start_station_id: station.id)

    visit station_path(station)

    expect(page).to have_content(station.started_rides)
  end

  scenario 'it shows the number of rides started at it' do
    station = create(:station_1)
    create(:trip, end_station_id: station.id)
    create(:trip, end_station_id: station.id)
    create(:trip, end_station_id: station.id)
    create(:trip, end_station_id: station.id)
    create(:trip, end_station_id: station.id)

    visit station_path(station)

    expect(page).to have_content(station.ended_rides)
  end

  scenario 'it shows the most frequent origin' do
    station1 = create(:station_1)
    station2 = create(:station_2)
    station3 = create(:station_1)
    create(:trip, start_station_id: station1.id, end_station_id: station2.id)
    create(:trip, start_station_id: station1.id, end_station_id: station2.id)
    create(:trip, start_station_id: station1.id, end_station_id: station2.id)
    create(:trip, start_station_id: station3.id, end_station_id: station2.id)
    create(:trip, start_station_id: station3.id, end_station_id: station2.id)

    visit station_path(station1)

    expect(page).to have_content(station2.frequent_origin.name )
  end

  scenario 'it shows the most frequent destination' do
    station1 = create(:station_1)
    station2 = create(:station_2)
    station3 = create(:station_1)
    create(:trip, start_station_id: station1.id, end_station_id: station2.id)
    create(:trip, start_station_id: station1.id, end_station_id: station2.id)
    create(:trip, start_station_id: station1.id, end_station_id: station2.id)
    create(:trip, start_station_id: station3.id, end_station_id: station2.id)
    create(:trip, start_station_id: station3.id, end_station_id: station2.id)


    visit station_path(station1)

    expect(page).to have_content(station1.frequent_destination.name)
  end

  scenario 'it shows the Date with the highest number of trips started at this station' do
    station = create(:station_1)
    create(:trip, start_station_id: station.id, start_date: Time.now)
    create(:trip, start_station_id: station.id, start_date: Time.now)
    create(:trip, start_station_id: station.id, start_date: Time.now)
    create(:trip, start_station_id: station.id, start_date: Time.now + 3000000)
    create(:trip, start_station_id: station.id, start_date: Time.now + 3000000)

    visit station_path(station)

    expect(page).to have_content(station.most_trips_started)
  end

  scenario 'it shows the most used starting zip code' do
    station = create(:station_1)
    create(:trip, start_station_id: station.id, zip_code: 80221)
    create(:trip, start_station_id: station.id, zip_code: 80221)
    create(:trip, start_station_id: station.id, zip_code: 80221)
    create(:trip, start_station_id: station.id, zip_code: 76482)
    create(:trip, start_station_id: station.id, zip_code: 89283)  

    visit station_path(station)

    expect(page).to have_content(station.most_used_zip)
  end

  scenario 'it shows the most used starting bike' do
    station = create(:station_1)
    create(:trip, start_station_id: station.id, bike_id: 99)
    create(:trip, start_station_id: station.id, bike_id: 99)
    create(:trip, start_station_id: station.id, bike_id: 5)
    create(:trip, start_station_id: station.id, bike_id: 1)
    create(:trip, start_station_id: station.id, bike_id: 3)  
    
    visit station_path(station)

    expect(page).to have_content(station.most_used_bike)
  end
end
