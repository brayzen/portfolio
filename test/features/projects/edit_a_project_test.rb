require 'test_helper'

feature "Edit A Project" do
  scenario "When existing project is clicked, edit ability is executed" do
    visit new_project_path
    fill_in "Name", with: "Number 1 project"
    fill_in "Technologies used", with: "Ruby, HTML, CSS, RAILS"
    click_on "Create Project"
    assert_page '/projects/1/', project_path
    click_on "Edit"
    Fill_in "Name", with: "Bray project"
    click_on "Submit"
    page.text.must_include "Bray project"
    assert page.has_css?(".notice"), "Project has been edited."
  end
end

