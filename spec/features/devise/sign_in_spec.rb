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
