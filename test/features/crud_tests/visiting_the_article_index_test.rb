require "test_helper"

feature "Visiting the Article Index" do
  scenario "existing articles, show list" do
    Article.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit '/articles'
    page.text.must_include "Means striving for excellence."
    page.wont_have_content "Welcome to my Welcome page"
  end
end
