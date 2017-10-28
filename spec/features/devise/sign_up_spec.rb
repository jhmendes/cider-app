require 'rails_helper'


# Feature: User Signs Up
#
# User Story:
#
# As a prospective user
# I want to create an account
# So that I can post ciders, cideries, review both
#
# Acceptance Criteria:
#
# I currently do not have an account
# On the homepage, I should an option to sign up
# Once on the account sign up page, there should be a sign up form for me to fill out
# That form requires my first and last name, email, zip code, and a password that matches
# I should be able to click a button that reads ‘Sign Up’ which officially signs me up
# I should see a ‘Signed up Successfully’ message in the top bar
# If I do not supply complete information for the form, I should receive error messages telling me what I need to fill out/correct
# If I try to sign up after I am already a user, I should see error messages and not be able to sign up a 2nd time.
#

feature "user signs up" do
  scenario "user specifies valid and required information" do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: "John"
    fill_in 'Last Name', with: "Mendes"
    fill_in 'E-Mail', with: "johnlovescider@gmail.com"
    fill_in 'user_password', with: "ciderisgreat"
    fill_in 'Password Confirmation', with: "ciderisgreat"

    click_button 'Sign Up'

    expect(page).to have_content("Sign Up Successful!  Drink some cider to celebrate!")
    expect(page).to have_content("Sign Out")

  end

  scenario "required information not specified" do
    visit root_path

    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Sign Out")
  end

  scenario "Passwords don't match" do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: "John"
    fill_in 'Last Name', with: "Mendes"
    fill_in 'E-Mail', with: "johnlovescider@gmail.com"
    fill_in 'user_password', with: "ciderisgreat"
    fill_in 'Password Confirmation', with: "ciderisntmyfavorite"

    click_button 'Sign Up'

    expect(page).to have_content("doesn't match Password")
    expect(page).to_not have_content("Sign Out")
  end
end
