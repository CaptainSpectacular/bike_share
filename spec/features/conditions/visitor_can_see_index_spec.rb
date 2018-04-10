require 'rails_helper'

describe 'visitor visits' do
  describe 'conditions index page' do
    it 'they see all conditions' do
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
    end
  end
end