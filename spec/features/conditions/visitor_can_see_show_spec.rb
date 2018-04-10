require 'rails_helper'

describe 'visitor visits' do
  describe 'conditions show page' do
    it 'they see condition specs' do
      guest = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(guest)

      condition = create(:con1)

      visit condition_path(condition)

      condition.attributes.each_value do |attr|
        expect(page).to have_content(attr)
      end
    end
  end
end