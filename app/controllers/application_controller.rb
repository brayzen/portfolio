class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  def logged_in_user
    unless user_signed_in?
      store_location
      flash[:notice] = "Log in required for that action."
      redirect_to new_user_session_path
    end
  end
end
