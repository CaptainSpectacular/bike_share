require 'rails_helper'

describe 'admin visits' do
  describe 'conditions show page' do
    it 'they see condition specs' do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      condition = create(:con1)

      visit condition_path(condition)

      condition.attributes.each_value do |attr|
        expect(page).to have_content(attr)
      end

      expect(page).to have_link('Delete')
      expect(page).to have_link('Edit')
    end
  end
end