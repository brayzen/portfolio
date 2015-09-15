require "test_helper"

feature "As a site visitor, I want to be able to sign up for an account,
so that I can perform actions that require me to be logged in." do
  scenario "Sign Up" do
    # Given a registration form
    visit "/"
    click_on "Log in"
    click_on "Sign up"
    # When I register with valid info
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"

    # Then I should be signed up
    page.must_have_content "Welcome! You have signed up successfully"
    page.wont_have_content "There was a problem with your sign up"
  end

  scenario "sign in with twitter works" do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:twitter,
                            {
                            uid: '12345',
                            info: { nickname: 'test_twitter_user'},
                            })
    visit root_path
    Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]

    click_on "Sign in with Twitter"
    page.must_have_content "Logged in as test_twitter_user"
  end

# Courtesy of: https://gist.github.com/ivanoats/7071730
# with help from https://github.com/intridea/omniauth/wiki/Integration-Testing

  scenario "sign in with github works" do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:github,
                            {
                            uid: '12345',
                            info: { nickname: 'test_github_user'},
                            })
    visit new_user_session_path
    Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]

    click_on "Sign in with Github"
    page.must_have_content "Logged in as test_github_user"
    save_and_open_page
end
# Courtesy of: https://gist.github.com/ivanoats/7071730
# with help from https://github.com/intridea/omniauth/wiki/Integration-Testing
end
