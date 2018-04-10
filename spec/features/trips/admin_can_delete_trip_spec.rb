require 'rails_helper'

describe 'As an admin' do
  describe 'when I visit the trip show page' do
    it 'I see a button to delete the trip and to edit the trip' do
      admin = create(:admin)
      trip = create(:trip)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit trip_path(trip)

      expect(page).to have_link('Edit')
      expect(page).to have_link('Delete')
    end
  end
end

describe 'As a regular user' do
  describe 'when I visit the trip show page' do
    it 'I can not see an edit or delete button' do
      user = create(:user)
      trip = create(:trip)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit trip_path(trip)

      expect(page).to_not have_link('Edit')
      expect(page).to_not have_link('Delete')
    end
  end
end
