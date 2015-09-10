require "test_helper"

feature "Creating an Article" do
  scenario "submit form data to create a new article" do
    log_in
    visit '/articles/new'
    fill_in "Title", with: articles(:cr).title
    fill_in "Body", with: articles(:cr).body
    click_on 'Create Article'
    # current_path.must_equal articles_path(
    page.text.must_include articles(:cr).title
    page.wont_have_content "Goobye All!"
    page.has_css? "#author"
    page.text.must_include users(:kit).email
  end
end
