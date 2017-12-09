require 'rails_helper'
# require 'rspec/rails'
# Feature: User Creates Cider
#
# User Story:
#
# As an authenticated user
# I want to add a cider
# So that I can review it and allow others to review it
#
# Acceptance Criteria:
#
# Once I am signed in, I should see a button in the top bar for adding a cider
# This button takes me to a page with a form to fill out with all fields for a cider
# I must fill in all details for the submission to valid
# If I do not fill in sufficient information, I should receive errors
# Once I finish filling out the form, I can click a submit button.
# I should see a ‘success’ message in the top bar and be taken to the particular cider’s ‘show’ page


feature "user creates a new cider" do


  scenario "user successfully creates a cider" do
    user = FactoryGirl.create(:user)
    cider = FactoryGirl.create(:cider)

    visit root_path
    click_link 'Sign In'
    fill_in 'E-Mail', with: user.email
    fill_in 'Password', with: user.password

    click_link 'Sign In'

    click_link 'Ciders'


    click_link 'Add a Cider'

    fill_in 'Company', with: cider.company
    fill_in 'Style', with: cider.style
    fill_in 'ABV', with: cider.abv
    select 'Year Round', from: 'Season'
    fill_in 'Description', with: cider.description

    click_button 'Create Cider'

    expect(page).to have_content('Cider Created Successfully!')
    expect(page).to have_content(cider.company)
    expect(page).to have_content(cider.style)
    expect(page).to have_content(cider.abv)
    expect(page).to have_content(cider.season)
    expect(page).to have_content(cider.description)

  end

  scenario "user does not supply enough information to create a cider" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'E-Mail', with: user.email
    fill_in 'Password', with: user.password

    click_link 'Sign In'

    click_link 'Ciders'


    click_link 'Add a Cider'

    click_button 'Create Cider'

    expect(page).to have_content("can't be blank")
    expect(page).to have_content("Failed to Save Cider")

  end




end
