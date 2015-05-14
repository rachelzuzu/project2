# require 'rails_helper'

# # feature 'User sign in' do
# #   scenario 'with valid credentials' do
# #     visit new_user_session_path
# #     fill_in 'email', with: 'joe.example@example.com'
# #     fill_in 'password', with: 'password'
# #     click_on 'Log in'

# #     expect(page).to have_content('Signed in successfully')
# #   end

# describe "the signin process", :type => :feature do
#   before :each do
#     FactoryGirl.build(:user, :email => 'user@example.com', :password => 'password')
#   end

#   it "signs me in" do
#     visit '/sessions/new'
#     within("#session") do
#       fill_in 'Email', :with => 'user@example.com'
#       fill_in 'Password', :with => 'password'
#     end
#     click_button 'Log in'
#     expect(page).to have_content 'Success'
#   end

# end