require "test_helper"

feature "Editing an Article" do
  scenario "Submit updates to an existing article" do
    sign_in(:author)
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

  scenario "authors can update articles" do
    sign_in(:author)
    visit article_path articles(:cr)
    page.must_have_link "Edit"
  end

  scenario "editors can update articles" do
    sign_in(:editor)
    visit article_path articles :http
    page.must_have_link "Edit"
  end

  scenario "Visitor cannot edit articles" do
    sign_in(:kit)
    visit articles_path
    page.wont_have_link "Edit"
  end
end
