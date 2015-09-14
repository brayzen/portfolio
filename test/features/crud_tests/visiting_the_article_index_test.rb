require "test_helper"

feature "Visiting the Article Index" do
  scenario "existing articles, show list" do
    Article.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit '/articles'
    page.text.must_include "Means striving for excellence."
    page.wont_have_content "Welcome to my Welcome page"
  end

  scenario "editors can see all published and unpublished index page" do
    sign_in(:editor)
    visit articles_path
    page.text.must_include "Published"
    page.text.must_include "unpublished"
  end

  scenario "visitors can only see published articles" do
    sign_in(:kit)
    visit articles_path
    page.must_include "Published"
    page.wont_include "unpublished"
  end
end
