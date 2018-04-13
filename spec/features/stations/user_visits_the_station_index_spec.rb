require 'rails_helper'

describe 'user visits station index page' do
  scenario 'user sees all stations information' do
    station_1 = create(:station_1)
    station_2 = create(:station_2)
    visit stations_path

    expect(page).to have_content(station_1.name)
    expect(page).to have_content("Dock Count: #{station_1.dock_count}")
    expect(page).to have_content(station_1.city)
    expect(page).to have_content(station_1.installation_date)
    expect(page).to have_content(station_2.name)
    expect(page).to have_content("Dock Count: #{station_2.dock_count}")
    expect(page).to have_content(station_2.city)
    expect(page).to have_content(station_2.installation_date)
    expect(page).to_not have_content("Edit")
    expect(page).to_not have_content("Edit")
  end
end
