require 'test_helper'

feature "I want a view for seeing the project I select" do
  scenario 'show me the project I select' do
    visit projects_path
    within("#project_145475190") do
      click_on("Show")
    end
    page.text.must_include "Barnyard Cereal"
    page.text.wont_include "How meta"
  end
end
