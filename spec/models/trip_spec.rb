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
    it{should respond_to :start_station}
    it{should respond_to :end_station}
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

    it '.average_duration' do
      create(:trip, duration: 30)
      create(:trip, duration: 30)
      create(:trip, duration: 30)
      create(:trip, duration: 40)
      create(:trip, duration: 50)

      expect(Trip.average_duration).to eq(36)
    end

    it '.min_duration' do
      create(:trip, duration: 30)
      create(:trip, duration: 30)
      create(:trip, duration: 30)
      create(:trip, duration: 40)
      create(:trip, duration: 50)

      expect(Trip.min_duration).to eq(30)
    end

    it '.max_duration' do
      create(:trip, duration: 30)
      create(:trip, duration: 30)
      create(:trip, duration: 30)
      create(:trip, duration: 40)
      create(:trip, duration: 50)

      expect(Trip.max_duration).to eq(50)
    end

    it '.group_by_month' do
      create(:trip, start_date: Time.parse('2012-4-1'))
      create(:trip, start_date: Time.parse('2012-4-1'))
      create(:trip, start_date: Time.parse('2012-5-1'))
      create(:trip, start_date: Time.parse('2012-5-1'))
      create(:trip, start_date: Time.parse('2012-6-1'))

      expected = {'2012-06-01 00:00:00.000000000 +0000'.to_time => 1, '2012-04-01 00:00:00.000000000 +0000'.to_time => 2, '2012-05-01 00:00:00.000000000 +0000'.to_time => 2}

      expect(Trip.group_by_month).to eq(expected)
    end

    it '.beautify_group_by_month' do
      create(:trip, start_date: Time.parse('2012-4-1'))
      create(:trip, start_date: Time.parse('2012-4-1'))
      create(:trip, start_date: Time.parse('2012-5-1'))
      create(:trip, start_date: Time.parse('2012-5-1'))
      create(:trip, start_date: Time.parse('2012-6-1'))

      expected = {'2012-06' => 1, '2012-04' => 2, '2012-05' => 2}

      expect(Trip.beautify_group_by_month).to eq(expected)
    end

    it '.popular_starting_station' do
      station1 = create(:station_1)
      station2 = create(:station_2)
      create(:trip, start_station: station1)
      create(:trip, start_station: station1)
      create(:trip, start_station: station1)
      create(:trip, start_station: station2)
      create(:trip, start_station: station2)

      expect(Trip.popular_starting_station).to eq(station1.name)
    end

    it '.popular_ending_station' do
      station1 = create(:station_1)
      station2 = create(:station_2)
      create(:trip, end_station: station1)
      create(:trip, end_station: station1)
      create(:trip, end_station: station1)
      create(:trip, end_station: station2)
      create(:trip, end_station: station2)

      expect(Trip.popular_ending_station).to eq(station1.name)
    end

    it '.bike_use' do 
      create(:trip, bike_id: 1)
      create(:trip, bike_id: 1)
      create(:trip, bike_id: 1)
      create(:trip, bike_id: 2)
      create(:trip, bike_id: 2)

      expected = { 1 => 3, 2 => 2 }

      expect(Trip.bike_use).to eq(expected)
    end

    it '.popular_bike' do
      create(:trip, bike_id: 1)
      create(:trip, bike_id: 1)
      create(:trip, bike_id: 1)
      create(:trip, bike_id: 2)
      create(:trip, bike_id: 2)

      expect(Trip.popular_bike).to eq([1, 3])
    end

    it '.unpopular_bike' do
      create(:trip, bike_id: 1)
      create(:trip, bike_id: 1)
      create(:trip, bike_id: 1)
      create(:trip, bike_id: 2)
      create(:trip, bike_id: 2)

      expect(Trip.unpopular_bike).to eq([2, 2])
    end

    it '.group_subscriptions' do
      create(:trip, subscription_type: 'Customer')
      create(:trip, subscription_type: 'Customer')
      create(:trip, subscription_type: 'Customer')
      create(:trip, subscription_type: 'Subscriber')
      create(:trip, subscription_type: 'Subscriber')

      expected = { 'Customer' => 3, 'Subscriber' => 2 }

      expect(Trip.group_subscriptions).to eq(expected)
    end

    it '.subscribtion_breakdown' do
      create(:trip, subscription_type: 'Customer')
      create(:trip, subscription_type: 'Customer')
      create(:trip, subscription_type: 'Customer')
      create(:trip, subscription_type: 'Subscriber')
      create(:trip, subscription_type: 'Subscriber')

      expect(Trip.subscribtion_breakdown('Customer')).to eq([3, 60])
      expect(Trip.subscribtion_breakdown('Subscriber')).to eq([2, 40])
    end

    it '.group_date' do
      time1 = Time.now.strftime('%a, %d %b %Y').to_date
      time2 = (Time.now + 200000).strftime('%a, %d %b %Y').to_date

      create(:trip, start_date: time1)
      create(:trip, start_date: time1)
      create(:trip, start_date: time1)
      create(:trip, start_date: time2)
      create(:trip, start_date: time2)

      expected = { time1 => 3, time2 => 2 }

      expect(Trip.group_date).to eq(expected)
    end

    it '.busy_date' do
      time1 = Time.now.strftime('%a, %d %b %Y').to_date
      time2 = (Time.now + 200000).strftime('%a, %d %b %Y').to_date

      create(:trip, start_date: time1)
      create(:trip, start_date: time1)
      create(:trip, start_date: time1)
      create(:trip, start_date: time2)
      create(:trip, start_date: time2)

      expect(Trip.busy_date).to eq([time1, 3])
    end

    it '.dead_date' do
      time1 = Time.now.strftime('%a, %d %b %Y').to_date
      time2 = (Time.now + 200000).strftime('%a, %d %b %Y').to_date

      create(:trip, start_date: time1)
      create(:trip, start_date: time1)
      create(:trip, start_date: time1)
      create(:trip, start_date: time2)
      create(:trip, start_date: time2)

      expect(Trip.dead_date).to eq([time2, 2])
    end
  end
end
