require 'rails_helper'

describe 'admin visits a new station page' do
  scenario 'they can delete a station' do
    admin = create(:admin)
    station_1 = create(:station_1)
    station_2 = create(:station_2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit stations_path

    within(".station-#{station_1.id}") do
      click_on "Delete"
    end

    expect(current_path).to eq(stations_path)
    expect(page).to have_content(station_2.name)
    expect(page).to have_content("#{station_1.name} was deleted!")
    expect(page).to_not have_content(station_1.city)
    expect(page).to_not have_content(station_1.installation_date)
  end
end
