class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    puts "under user, it made it to the controller"
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Signed in as #{user.email}"
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end
  alias_method :twitter, :all
  alias_method :github, :all
end
