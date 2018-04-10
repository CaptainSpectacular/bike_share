require 'rails_helper'

describe 'as an admin' do
  describe 'on the index' do
    it 'can delete condition' do
      admin = create(:admin)
      condition1 = create(:con1)
      condition2 = create(:con2)
      allow_any_instance_of(Admin::BaseController).to receive(:current_user).and_return(admin)

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
end