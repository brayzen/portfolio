require "test_helper"

feature "Editing an Article" do
  scenario "Submit updates to an existing article" do
    visit new_user_session_path
    fill_in "Email", with: users(:kat).email
    fill_in "Password", with: "password"
    find(".actions input[type=submit]").click

    visit new_article_path
    fill_in "Title", with: "Becoming a Code Fellow"
    fill_in "Body", with: "Means striving for excellence."
    click_on 'Create Article'
    click_on "Edit"
    fill_in 'Body', with: "2nd ammendment, went well no?"
    click_on "Update Article"
    page.must_have_content "Article was successfully updated"
    # page.must_include "2nd ammendment"
    page.wont_have_content "Means striving for excellence."
  end
end
