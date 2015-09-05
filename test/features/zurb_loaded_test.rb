require "test_helper"

feature "Attached ZURB styles" do
  scenario "Zurb css selectors will be verified" do
    # Given: a home page
    visit '/'
    # When: loaded up or started
    page.must_have_content "CEO's were thought"
    # Then: should contain a link to zurb assets or columns
    page.has_css? 'nav.top-bar'
  end
end
