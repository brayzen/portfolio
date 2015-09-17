require "test_helper"

feature "Deleting an Article" do
  scenario "article is deleted with a click" do
    sign_in(:editor)
    visit articles_path
    first(:link, 'Destroy').click # incase of a confirmation
    page.wont_have_content "It's all about the request-response cycle!"
    page.must_have_content 'Article was successfully destroyed.'
  end

  scenario "Author can't see delete button, can't destroy" do
    sign_in(:author)
    visit articles_path
    page.wont_have_link "Destroy"
  end

  scenario "Editor can delete articles" do
    sign_in(:editor)
    visit articles_path
    page.must_have_link "Destroy"
  end

  scenario "Visitor cannot delete articles" do
    sign_in(:kit)
    page.wont_have_link "Destroy"
  end

end
