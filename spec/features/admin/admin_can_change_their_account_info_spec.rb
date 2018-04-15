require 'rails_helper'

describe 'As an admin' do
  it 'I can modify my account data' do
    admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit edit_user_path(admin)
    fill_in 'user[username]', with: 'new_admin'
    fill_in 'user[password]', with: 'hello'
    fill_in 'user[password_confirmation]', with: 'hello'

    expect(page).to have_content('Logged in as new_admin')
  end

  it 'I am unable to modify another user\'s account' do
  end
end
