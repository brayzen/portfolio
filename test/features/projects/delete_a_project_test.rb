require 'test_helper'

feature 'I want to delete a portfolio item,
 so that I can keep the list focused on my best work' do
  scenario 'delete my project when I say' do
    visit projects_path
    within("#project_145475190") do
      click_on("Destroy")
    end
    page.text.wont_include "Barnyard Cereal"
    page.text.must_include "How meta"
  end
end
