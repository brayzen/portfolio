require "test_helper"

feature "Deleting an Article" do
  scenario "article is deleted with a click" do
    log_in
    visit articles_path
    begin_text = page.text
    first(:link, 'Destroy').click # incase of a confirmation
    end_text = page.text
    begin_text.wont_equal end_text
    # puts begin_text
    # puts "$$$$$$$$$$$$$$$$$$"
    # puts end_text
    page.wont_have_content "It's all about the request-response cycle!"
    page.must_have_content 'Article was successfully destroyed.'
  end
end
