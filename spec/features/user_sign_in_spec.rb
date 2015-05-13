require 'rails_helper'

feature 'User sign in' do
  scenario 'with valid credentials' do
    visit new_user_session_path
    fill_in 'email', with: 'joe.example@example.com'
    fill_in 'password', with: 'password'
    click_on 'Log in'

    expect(page).to have_content('You have successfully signed in!')
  end
end