require 'rails_helper'

describe 'As an user' do
  it 'I can modify my account data' do
    admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit edit_user_path(admin)
    fill_in 'user[username]', with: 'new_admin'
    fill_in 'user[password]', with: 'hello'
    fill_in 'user[password_confirmation]', with: 'hello'
    click_on 'Change account'

    expect(page).to have_content('Logged in as ADMIN new_admin')
    expect(page).to have_content('Your account was successfully updated, new_admin')
  end

  it 'I am unable to modify another user\'s account' do
    user = create(:user)
    user2 = create(:user2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_user_path(user2)

    expect(page).to have_content('The page you were looking for doesn\'t exist')
  end
end
