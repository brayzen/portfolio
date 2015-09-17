# Rails.env = "test"
ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require 'capybara'
require "minitest/pride"
# require "poltergeist"

class ActiveSupport::TestCase
  fixtures :all
end

# system 'rubocop'

def log_in(email = "kit@example.com", password = "password")
  visit root_path
  find(".nav-bar .button-group li:last-child a").click
  fill_in "Email", with: email
  fill_in "Password", with: password
  find(".actions input[type=submit]").click
  page.text.must_include 'Signed in successfully.'
end

def sign_in(role = :editor)
  visit new_user_session_path
  # save_and_open_page
  fill_in "Email", with: users(role).email
  fill_in "Password", with: 'password'
  find(".actions input[type=submit]").click
end
