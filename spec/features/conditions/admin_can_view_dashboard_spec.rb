require 'rails_helper'

describe 'as an admin' do
  describe 'visiting the dashboard' do
    it 'can see stats about condition temps' do
      condition_1 = create(:con1, max_temp: 50)
      condition_2 = create(:con1, max_temp: 55)
      condition_3 = create(:con1, max_temp: 53)
      condition_4 = create(:con1, max_temp: 69)
      condition_5 = create(:con1, max_temp: 20)
      trip_1      = create(:trip, condition: condition_2)
      trip_2      = create(:trip, condition: condition_3)
      trip_3      = create(:trip, condition: condition_3)
      trip_4      = create(:trip, condition: condition_3)
      trip_5      = create(:trip, condition: condition_5)

      visit conditions_dashboard_path

      expect(page).to have_content(Condition.trips_temp_breakdown)
    end

    it 'can see stats about condition precipitation' do
      condition_1 = create(:con1, precipitation: 50)
      condition_2 = create(:con1, precipitation: 55)
      condition_3 = create(:con1, precipitation: 53)
      condition_4 = create(:con1, precipitation: 69)
      condition_5 = create(:con1, precipitation: 20)
      trip_1      = create(:trip, condition: condition_2)
      trip_2      = create(:trip, condition: condition_3)
      trip_3      = create(:trip, condition: condition_3)
      trip_4      = create(:trip, condition: condition_3)
      trip_5      = create(:trip, condition: condition_5)

      visit conditions_dashboard_path

      expect(page).to have_content(Condition.trips_precipitation_breakdown)
    end
  end
end
