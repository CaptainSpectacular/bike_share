require 'rails_helper'

describe 'user visits a stations show page' do
  scenario 'it shows all that stations information' do
    station_1 = create(:station_1)
    station_2 = create(:station_2)

    visit station_path(station_1)

    expect(current_path).to eq('/stations/broadway')
    expect(page).to have_content(station_1.name)
    expect(page).to have_content(station_1.dock_count)
    expect(page).to have_content(station_1.installation_date)
    expect(page).to have_content(station_1.city)
    expect(page).to_not have_content(station_2.name)
    expect(page).to_not have_content(station_2.dock_count)
    expect(page).to_not have_content(station_2.installation_date)
    expect(page).to_not have_content(station_2.city)
  end
end
