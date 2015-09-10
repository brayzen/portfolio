Rails.env = "test"
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

system 'rubocop'
