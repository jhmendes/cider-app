require 'rails_helper'
require 'rspec/rails'
# Feature: User Signs In
#
# User Story:
#
# As an unauthenticated user
# I want to to sign in
# So that I can post ciders, cideries, and review them as well as update/edit my entries
#
# Acceptance Criteria:
#
# If I am currently not signed in, I should be able to click a button that brings me to a sign in page
# I should see a form to fill out my user account information for email and password
# I should be able to click a button that logs me in
# If It is successful, I am redirected to the index/home page and will see a ‘Signed in Successfully’ message in the top bar/message area
# If unsuccessful, I will see an error message either for wrong email or wrong password, or both
# I should see buttons to link me back to a ‘Signup’ page and the homepage (all in top bar).


# pick up here using the devise video.
# write out the tests and then start installing devise
# sign up for balsamiq and mock up a design

feature "user signs in" do

 scenario "an existing specifies a valid email and password" do

   user = FactoryGirl.create(:user)


   visit root_path
   click_link 'Sign In'
   fill_in 'E-Mail', with: user.email
   fill_in 'Password', with: user.password

   click_button 'Sign In'


   expect(page).to have_content("Welcome Back!")
   expect(page).to have_content("Sign Out")


 end


 scenario "non-existant user tries to sign in with email and password that doesn't exist in database" do
   visit root_path
   click_link 'Sign In'
   fill_in 'E-Mail', with: 'nobody@example.com'
   fill_in 'Password', with: 'password'
   click_button 'Sign In'

   expect(page).to have_content('Invalid Email or password.')
   expect(page).to_not have_content('Welcome Back!')
   expect(page).to_not have_content('Sign Out')
 end


  scenario "existing email with wrong password is denied access" do
       user = FactoryGirl.create(:user)

       visit root_path
       click_link 'Sign In'
       fill_in 'E-Mail', with: user.email
       fill_in 'Password', with: 'wrong password'

       click_button 'Sign In'

       expect(page).to have_content('Invalid Email or password.')
       expect(page).to_not have_content('Welcome Back!')
       expect(page).to_not have_content('Sign Out')
  end



 scenario "an already authenticated user cannot re-sign in" do
   user = FactoryGirl.create(:user)

   visit new_user_session_path

   fill_in 'E-Mail', with: user.email
   fill_in 'Password', with: user.password

   click_button 'Sign In'


   expect(page).to have_content("Sign Out")
   expect(page).to_not have_content("Sign In")

   visit new_user_session_path
  expect(page).to have_content("You are already signed in.")

 end


end
