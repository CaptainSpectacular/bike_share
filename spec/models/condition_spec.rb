require 'rails_helper'

RSpec.describe Condition, type: :model do
  describe 'validations' do
    it{should validate_presence_of :date}
    it{should validate_presence_of :max_temp}
    it{should validate_presence_of :min_temp}
    it{should validate_presence_of :average_temp}
    it{should validate_presence_of :average_humidity}
    it{should validate_presence_of :average_visibility}
    it{should validate_presence_of :average_windspeed}
    it{should validate_presence_of :precipitation}
  end

  describe 'relationships' do
    it{is_expected.to have_many(:trips)}
  end

  describe 'class methods' do
    it '.trips_with_temp' do
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

      expect(Condition.trips_with_temp(50..60).sum).to eq(4)
      expect(Condition.trips_with_temp(20..30).sum).to eq(1)
      expect(Condition.trips_with_temp(20..70).sum).to eq(5)
    end

    it '.trips_temp_breakdown' do
      condition_1 = create(:con1, max_temp: 50)
      condition_2 = create(:con1, max_temp: 55)
      condition_3 = create(:con1, max_temp: 53)
      condition_4 = create(:con1, max_temp: 69)
      condition_5 = create(:con1, max_temp: 90)
      trip_1      = create(:trip, condition: condition_2)
      trip_2      = create(:trip, condition: condition_3)
      trip_3      = create(:trip, condition: condition_3)
      trip_4      = create(:trip, condition: condition_3)
      trip_5      = create(:trip, condition: condition_5)

      expected = [['40 - 49', 0, 0, 0],
                  ['50 - 59', 1, 3, 2.0],
                  ['60 - 69', 0, 0, 0],
                  ['70 - 79', 0, 0, 0],
                  ['80 - 89', 0, 0, 0],
                  ['90 - 99', 1, 1, 1],
                  ['100 - 110', 0, 0, 0]]

      expect(Condition.trips_temp_breakdown).to eq(expected)
    end

    it '.trips_pre_breakdown' do
      condition_1 = create(:con1, precipitation: 0)
      condition_2 = create(:con1, precipitation: 0)
      condition_3 = create(:con1, precipitation: 0.48)
      condition_4 = create(:con1, precipitation: 0.67)
      condition_5 = create(:con1, precipitation: 0.99)
      trip_1      = create(:trip, condition: condition_2)
      trip_2      = create(:trip, condition: condition_3)
      trip_3      = create(:trip, condition: condition_3)
      trip_4      = create(:trip, condition: condition_3)
      trip_5      = create(:trip, condition: condition_5)
      expected = [['0 - 0.49', 1, 3, 2],
                  ['0.5 - 0.99', 1, 1, 1],
                  ['1 - 1.49', 0, 0, 0],
                  ['1.5 - 1.99', 0, 0, 0],
                  ['2 - 2.49', 0, 0, 0],
                  ['2.5 - 3', 0, 0, 0]]

      expect(Condition.trips_precipitation_breakdown).to eq(expected)
    end

    it '.trips_windspeed_breakdown' do
      condition_1 = create(:con1, average_windspeed: 0)
      condition_2 = create(:con1, average_windspeed: 2)
      condition_3 = create(:con1, average_windspeed: 12)
      condition_4 = create(:con1, average_windspeed: 13)
      condition_5 = create(:con1, average_windspeed: 1)
      trip_1      = create(:trip, condition: condition_2)
      trip_2      = create(:trip, condition: condition_3)
      trip_3      = create(:trip, condition: condition_3)
      trip_4      = create(:trip, condition: condition_4)
      trip_5      = create(:trip, condition: condition_5)
                  
      expected = [['0 - 3', 1, 1, 1.0],
                  ['4 - 7', 0, 0, 0], 
                  ['8 - 11', 0, 0, 0], 
                  ['12 - 15', 1, 2, 1.5], 
                  ['16 - 19', 0, 0, 0], 
                  ['20 - 23', 0, 0, 0]]

      expect(Condition.trips_windspeed_breakdown).to eq(expected)
    end

    it '.trips_visibility_breakdown' do
      condition_1 = create(:con1, average_visibility: 20)
      condition_2 = create(:con1, average_visibility: 20)
      condition_3 = create(:con1, average_visibility: 12)
      condition_4 = create(:con1, average_visibility: 13)
      condition_5 = create(:con1, average_visibility: 20)
      trip_1      = create(:trip, condition: condition_2)
      trip_2      = create(:trip, condition: condition_3)
      trip_3      = create(:trip, condition: condition_3)
      trip_4      = create(:trip, condition: condition_4)
      trip_5      = create(:trip, condition: condition_5)
      
      expected = [['4 - 7', 0, 0, 0],
                  ['8 - 11', 0, 0, 0],
                  ['12 - 15', 1, 2, 1.5],
                  ['16 - 19', 0, 0, 0],
                  ['20 - 23', 1, 1, 1]]

      expect(Condition.trips_visibility_breakdown).to eq(expected)
    end
  end
end
