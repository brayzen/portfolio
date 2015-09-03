require "test_helper"

feature "Editing an Article" do
  scenario "Submit updates to an existing article" do
    article = Article.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit article_path(article)
    click_on "Edit"
    fill_in 'Body', with: "2nd ammendment, went well no?"
    click_on "Update Article"
    page.must_have_content "Article was successfully updated"
    #page.must_include "2nd ammendment"
    page.wont_have_content "Goobye All!"
  end
end
