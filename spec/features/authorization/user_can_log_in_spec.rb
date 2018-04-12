require 'rails_helper'

describe 'Authorization' do
  describe 'user visits log in page' do
    it 'logs them in' do
      user = create(:user)

      visit login_path

      fill_in "username", with: user.username
      fill_in "password", with: user.password

      within("form") do
        click_on "Login"
      end

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Logged in as #{user.username}")
    end
  end
  describe 'user visits dashboard' do
    it 'creates a new account' do
      visit root_path
      click_on "Create Account"    
      fill_in "user[username]", with: "Batman"
      fill_in "user[password]", with: "Robin"
      click_on "Sign Up"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Account created successfully")
      expect(page).to have_content("Logged in as Batman")
      expect(page).to_not have_content("Login")
      expect(page).to have_content("Logout")
    end
  end
end
