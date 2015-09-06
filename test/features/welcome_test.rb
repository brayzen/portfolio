require "minitest/rails/capybara"
require "test_helper"

feature "Welcome test" do
  scenario "should visit the welcome index page" do
    visit root_path
    page.must_have_content "About"
    page.text.must_include "I believe the world will be a much better place"
  end
end
