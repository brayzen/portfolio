module SessionsHelper
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end
