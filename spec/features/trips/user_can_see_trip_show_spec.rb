require 'rails_helper'

describe 'Trip show' do
  describe 'user visits a trip show page' do
    it 'shows all the attributes of that trip' do
      trip = create(:trip)
      trip2 = create(:trip)

      visit trip_path(trip)

      trip.attributes.each_value do |attr|
       expect(page).to have_content(attr)
      end
      expect(page).to_not have_content(trip2.duration)
    end
  end
end
