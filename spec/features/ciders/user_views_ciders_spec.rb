require 'rails_helper'

# Feature: User Views All Ciders
#
# User Story:
#
# As an authenticated or unauthenticated user
# I want to view all ciders
# So I can see all possible ciders to try and if signed in, which want I want to review
#
#
# Acceptance Criteria:
#
#
# Whether I am signed in or not, I should be able to see a list of all ciders
# On the homepage, I should see a button that takes me to a page displaying all ciders
# Once on this page, I should see a list of all ciders in alphabetical order
# I should also see a list of the top 3-5 ciders, ordered by rating
# Each cider listing should be a clickable link that takes me to a show page for the cider
# I should also see a search bar that allows me to search for a cider.
# Searching for a cider brings me to a page displaying a list of all related results and I can click on the cider to view its show page

feature "user views all ciders" do

scenario "user successfully views all ciders" do
  cider = FactoryGirl.create(:cider)

  visit root_path

  click_link 'Ciders'

  expect(page).to have_content(cider.company)
  expect(page).to have_content(cider.style)


end


end
