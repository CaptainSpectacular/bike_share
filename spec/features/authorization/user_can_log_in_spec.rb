require 'rails_helper'

describe 'Authorization' do
  describe 'user visits log in page' do
    it 'logs them in' do
      user = create(:user)

      visit root_path
      click_on "Login"

      expect(current_path).to eq(login_path)

      fill_in "username", with: user.username
      fill_in "password", with: user.password
      click_on "Login"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Logged in as #{user.username}")
    end
  end
end
