require 'test_helper'

feature "visitor can see all comments on an article" do
  scenario "vistor see's each published artilce with comments" do
    sign_in(:visitor)
    visit article_path(1)
    page.text.must_include "Comment text 1"
    page.text.must_include "Comment text 2"
    page.text.must_include "Comment text 3"
  end
end

feature "visitor can CREATE a Comment on an article" do
  scenario "vistor can create a comment" do
    sign_in(:visitor)
    visit article_path(1)
    click_on "Create comment"
    # fill_in :post, :with "Comment text 4"
    page.text.must_include "Comment was successfully committed for review"
  end
end

feature "visitor can EDIT their own Comment on an article, once it has been VERIFIED:TRUE" do
  scenario "vistor can edit a comment" do
    sign_in(:visitor)
    visit article_path(1)
    # fill_in :post, :with 'Comment text 4'
    #pass in params Verified:true MOCK TEST
    click_on "Create comment"
    page.text.must_include "Comment text 4"
  end
end

feature "visitor can DELETE their own Comment on an article" do
  scenario "vistor can DELETE a comment, once it has been VERIFIED:TRUE" do
    sign_in(:visitor)
    visit article_path(1)
    # fill_in :post, :with 'Comment text 4'
    #pass in params Verified:true MOCK TEST
    click_on "Create comment"
    page.text.must_include "Comment text 4"
  end
end

