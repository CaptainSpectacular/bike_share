require 'rails_helper'

describe 'an admin' do
  describe 'visits the new conditions path' do
    it 'can create new conditions' do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit new_admin_condition_path

      fill_in 'condition[date]', with: '2018-12-02'
      fill_in 'condition[max_temp]', with: '3.0'
      fill_in 'condition[average_temp]', with: '3.0'
      fill_in 'condition[min_temp]', with: '3.0'
      fill_in 'condition[average_humidity]', with: '3.0'
      fill_in 'condition[average_visibility]', with: '3.0'
      fill_in 'condition[average_windspeed]', with: '3.0'
      fill_in 'condition[precipitation]', with: '3.0'

      click_on 'Create Condition'

      expect(current_path).to eq(condition_path(Condition.last))
      expect(page).to have_content('2018-12-02 was created!')
    end

    it 'gets an error by not filling in information' do
      admin = create(:admin)
      allow_any_instance_of(Admin::BaseController).to receive(:current_user).and_return(admin)
      visit new_admin_condition_path

      click_on 'Create Condition'

      expect(page).to have_content('Something went wrong. Please try again.')
    end
  end
end
