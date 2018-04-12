require 'rails_helper'

describe 'an admin/registered user' do
  describe 'visits the dashboard' do
    it 'see weather on day with highest rides' do
      condition = create(:con1)
      trip      = create(:trip, condition: condition)

      visit trips_dashboard_path

      expect(page).to have_content(Trip.best_weather)
    end

    it 'see weather on day with lowest rides' do
      condition = create(:con2)
      trip      = create(:trip, condition: condition)

      visit trips_dashboard_path

      expect(page).to have_content(Trip.worst_weather)
    end
  end
end
