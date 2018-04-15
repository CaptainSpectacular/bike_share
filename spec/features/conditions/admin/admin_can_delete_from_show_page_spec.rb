require 'rails_helper'

describe 'as an admin' do
  describe 'on the index' do
    it 'can delete condition' do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      condition1 = create(:con1)
      condition2 = create(:con2)

      visit conditions_path

      first('.delete').click

      expect(current_path).to eq(conditions_path)

      expect(page).to_not have_content(condition1.max_temp)
      expect(page).to_not have_content(condition1.average_temp)
      expect(page).to_not have_content(condition1.min_temp)
      expect(page).to_not have_content(condition1.precipitation)
      expect(page).to_not have_content(condition1.average_windspeed)
      expect(page).to_not have_content(condition1.average_visibility)
      expect(page).to_not have_content(condition1.average_humidity)

      condition2.attributes.each_value do |attr|
        expect(page).to have_content(attr)
      end
    end
  end

  describe 'on the show page' do
    it 'can delete condition' do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      condition = create(:con1)

      visit condition_path(condition)

      click_on 'Delete'

      expect(current_path).to eq(conditions_path)

      expect(page).to_not have_content(condition.max_temp)
      expect(page).to_not have_content(condition.average_temp)
      expect(page).to_not have_content(condition.min_temp)
      expect(page).to_not have_content(condition.precipitation)
      expect(page).to_not have_content(condition.average_windspeed)
      expect(page).to_not have_content(condition.average_visibility)
      expect(page).to_not have_content(condition.average_humidity)
    end
  end
end
