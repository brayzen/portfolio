require "test_helper"

feature "Deleting an Article" do
  scenario "article is deleted with a click" do
    visit articles_path
    first(:link,'Destroy').click  #incase of a confirmation
    page.wont_have_content "want to be a codefellow?"
    page.must_have_content 'Article was successfully destroyed.'
  end
end
