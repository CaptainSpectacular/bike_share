require 'rails_helper'

describe 'visitor visits' do
  describe 'conditions show page' do
    it 'they see condition specs' do
      condition = create(:con1)

      visit condition_path(condition)

      condition.attributes.each_value do |attr|
        expect(page).to have_content(attr)
      end
    end
  end
end