require "test_helper"

feature "Creating an Article as an Author" do
  scenario "submit form data to create a new article" do
    # log_in
    sign_in(:author)
    visit new_article_path
    fill_in "Title", with: articles(:cr).title
    fill_in "Body", with: articles(:cr).body
    click_on 'Create Article'
save_and_open_page
    page.wont_have_content "Goobye All!"
    page.has_css? "#author"
    page.text.must_include users(:author).email
    page.text.must_include "Status: Unpublished"
  end

  scenario "unathenticated site visitors cannot visit new_article_path" do
    visit new_article_path
    page.must_have_content "You need to sign in or sign up before continuing"
  end

  scenario "unauthenticated site vistiors cannot see new article button" do
    # When I visit the blog index page
    visit articles_path
    # Then I should not see the "New Article" button
    page.wont_have_link "New Article"
  end

  scenario "unauthenticated site visitors cannot see new article button" do
    visit articles_path
    page.wont_have_link "New Article"
  end

  scenario "authors can't publish" do
    sign_in(:author)
    visit new_article_path
    page.wont_have_field('published')
  end

  scenario "editors can publish" do
    sign_in(:editor)
    visit new_article_path
    page.must_have_field('Published')
    fill_in "Title", with: articles(:cr).title
    fill_in "Body", with: articles(:cr).body
    check "Published"
    click_on "Create Article"
    page.text.must_include "Status: Published"
  end
end
