require 'rails_helper'

describe 'admin visits' do
  describe 'conditions index page' do
    it 'they see all conditions' do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      condition1 = create(:con1)
      condition2 = create(:con2)

      visit conditions_path

      condition1.attributes.each_value do |attr|
        expect(page).to have_content(attr)
      end

      condition2.attributes.each_value do |attr|
        expect(page).to have_content(attr)
      end

      expect(page).to have_link(condition1.date)
      expect(page).to have_link(condition2.date)
      expect(page).to have_link('Edit')
      expect(page).to have_link('Delete')
    end
  end
end