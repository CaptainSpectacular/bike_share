require 'rails_helper'

describe 'admin visits a new station page' do
  scenario 'they can edit a new station' do
    admin = create(:admin)
    station_1 = create(:station_1)
    station_2 = create(:station_2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit edit_admin_station_path(station_1)

    fill_in "station[name]", with: "Louisiana Pearl"
    fill_in "station[dock_count]", with: 10
    fill_in "station[city]", with: "Denver"
    fill_in "station[installation_date]", with: "2018-04-04"
    click_on "Update Station"

    expect(current_path).to eq(station_path(station_1))
    expect(page).to have_content("Louisiana Pearl was updated!")
    expect(page).to have_content("10")
    expect(page).to have_content("Denver")
    expect(page).to have_content("2018-04-04")
  end
end
