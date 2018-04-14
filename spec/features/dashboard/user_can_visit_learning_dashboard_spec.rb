require "rails_helper"

describe "when the user visits the learning dashboard" do
  scenario "they see all the links to around the site" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    click_on "Learn!"
    expect(page).to have_content("All Stations")
    expect(page).to have_content("Trips Dashboard")
    expect(page).to have_content("All Trips")
    expect(page).to have_content("Conditions Dashboard")
    expect(page).to have_content("All Conditions")
  end
end
