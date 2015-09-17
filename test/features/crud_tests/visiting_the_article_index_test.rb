require "test_helper"

feature "Visiting the Article Index" do
  scenario "Authors can only see their own articles" do
    sign_in(:author)
    visit articles_path
    page.text.must_include "Code rails"
    page.wont_have_content "Intro to HTTP"
  end

  scenario "editors can see all published and unpublished index page" do
    sign_in(:editor)
    visit articles_path
    page.text.must_include "Code rails"
    page.text.must_include "Intro to HTTP"
  end

  scenario "visitors can only see published articles" do
    sign_in(:kit)
    visit articles_path
    page.text.must_include 'Intro to HTTP'
    page.text.wont_include 'Code rails'
  end
end
