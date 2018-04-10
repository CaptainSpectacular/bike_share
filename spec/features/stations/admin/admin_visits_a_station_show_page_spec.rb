require 'rails_helper'

describe 'admin visits the station index page' do
  scenario 'it sees edit and delete buttons' do
    admin = create(:admin)
    station_1 = create(:station_1)
    station_2 = create(:station_2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit station_path(station_1)

    expect(page).to have_content(station_1.name)
    expect(page).to have_content(station_1.dock_count)
    expect(page).to have_content(station_1.city)
    expect(page).to have_content(station_1.installation_date)
    expect(page).to have_content("Edit")
    expect(page).to have_content("Delete")
  end
  scenario 'as a user' do
    user = create(:user)
    station_1 = create(:station_1)
    station_2 = create(:station_2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit station_path(station_1)

    expect(page).to have_content(station_1.name)
    expect(page).to have_content(station_1.dock_count)
    expect(page).to have_content(station_1.city)
    expect(page).to have_content(station_1.installation_date)
    expect(page).to_not have_content("Edit")
    expect(page).to_not have_content("Delete")
  end
end
