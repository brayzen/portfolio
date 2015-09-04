require "minitest/rails/capybara"
require "test_helper"


feature "Welcome test" do
  scenario "should visit the welcome index page" do
    visit root_path
    page.must_have_content "About"
    page.text.must_include "You're looking for a developer"
  end
end

