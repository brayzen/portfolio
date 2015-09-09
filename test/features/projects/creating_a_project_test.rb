
require "test_helper"

feature "As the site owner, I want to add a portfolio item so that I can show off my work" do
  scenario "adding a new project" do
    visit projects_path
    click_on "New Project"
    fill_in "Name", with: "Code Fellows Portfolio"
    fill_in "Technologies used", with: "Rails, Ruby, Bootstrap, HTML5, CSS3"
    click_on "Create Project"
    page.text.must_include "Project has been created"
    assert page.has_css?(".notice"), "Expected a flash notice on this page, none found."
    page.status_code.must_equal 200
  end
end

feature "I want to confirm all submitted data is complete and valid" do
  scenario "new project has invalid data" do
    visit projects_path
    click_on "New Project"
    fill_in "Name", with: "Iw"
    fill_in "Technologies used", with: ""
    click_on "Create Project"
    # assert page.has_css?(".notice"), "Error"
    page.text.must_include "Invalid data, please try again."
    page.text.must_include "Name is too short"
    page.text.must_include "Technologies used can't be blank"
  end
end
