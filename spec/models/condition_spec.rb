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
    it '.avg_trips_with_condition' do
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

      expect(Condition.avg_trips_with_condition(50..60)).to eq(2)
      expect(Condition.avg_trips_with_condition(20..30)).to eq(1)
      expect(Condition.avg_trips_with_condition(20..70)).to eq(1.67)
    end
  end
end
