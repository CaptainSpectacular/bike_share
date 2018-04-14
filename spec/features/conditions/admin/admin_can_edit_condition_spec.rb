require 'rails_helper'

describe 'an admin' do
  describe 'visits the edit conditions path' do
    it 'can edit the condition' do
      admin = create(:admin)
      condition = create(:con1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit edit_admin_condition_path(condition)

      fill_in 'condition[date]', with: '2018-12-02'
      fill_in 'condition[max_temp]', with: '5.0'
      fill_in 'condition[average_temp]', with: '5.0'
      fill_in 'condition[min_temp]', with: '5.0'
      fill_in 'condition[average_humidity]', with: '5.0'
      fill_in 'condition[average_visibility]', with: '5.0'
      fill_in 'condition[average_windspeed]', with: '5.0'
      fill_in 'condition[precipitation]', with: '5.0'

      click_on 'Update Condition'

      expect(current_path).to eq(condition_path(condition))
      expect(page).to have_content('5.0')
      expect(page).to have_content('2018-12-02')
      expect(page).to have_content('Condition successfully updated.')
    end
  end
end