require 'test_helper'
require 'capybara'
require 'poltergiest'

feature 'new domain name' do
  scenario 'correct domain name is used to find URL' do
    # given the website domain name
    visit "https://brayzen1.com"
    # when a user types in URL
    page.text.must_include 'Brian Sheldon Ray || brayzen1'
    page.must_have_content 'My overarching passion 8'
    # then arrives at welcome_path
  end
end

feature "Welcome test" do
  scenario "should visit the welcome index page" do
    visit root_path
    page.must_have_content "About"
    page.text.must_include "I believe the world will be a much better place"
  end
end

