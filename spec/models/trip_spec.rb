require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'validations' do
    it{should validate_presence_of :duration}
    it{should validate_presence_of :start_date}
    it{should validate_presence_of :start_station_name}
    it{should validate_presence_of :start_station_id}
    it{should validate_presence_of :end_date}
    it{should validate_presence_of :end_station_name}
    it{should validate_presence_of :end_station_id}
    it{should validate_presence_of :bike_id}
    it{should validate_presence_of :subscription_type}
  end

  describe 'relationships' do
    it{should respond_to :stations}
    it{is_expected.to belong_to(:condition)}
  end

  describe 'class methods' do
    it '.best_weather' do
      condition1 = create(:con1)
      condition2 = create(:con2)
      trip1      = create(:trip, condition: condition1)
      trip2      = create(:trip, condition: condition1)
      trip3      = create(:trip, condition: condition1)
      trip4      = create(:trip, condition: condition2)
      trip5      = create(:trip, condition: condition2)

      expect(Trip.best_weather).to eq(condition1.id)
    end

    it '.worst_weather' do
      condition1 = create(:con1)
      condition2 = create(:con2)
      trip1      = create(:trip, condition: condition1)
      trip2      = create(:trip, condition: condition1)
      trip3      = create(:trip, condition: condition1)
      trip4      = create(:trip, condition: condition2)
      trip5      = create(:trip, condition: condition2)

      expect(Trip.worst_weather).to eq(condition2.id)
    end
  end
end
