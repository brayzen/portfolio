require 'test_helper'

feature 'As the site owner, I want to sign out a user to prevent fraud' do
  scenario 'user signs in then signs out' do
    visit root_path
    click_on 'Sign Up'
    fill_in "Email", with: "test2@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on 'Sign up'
    page.text.must_include 'Sign out'
    click_on 'Sign out'
    page.text.must_include 'Signed out successfully.'
  end
end
