require 'test_helper'

feature 'As the site owner, I want to sign out a user to prevent fraud' do
  scenario 'user logs in then logs out' do
    log_in
    click_on 'Log out'
    page.text.must_include 'Signed out successfully.'
  end
end
