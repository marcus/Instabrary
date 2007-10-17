# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  
  helper :all # include all helpers, all the time
  
  before_filter :login_from_cookie
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'd7a47c48d2fec4a3e3d3c56345144132'
  
  def verify_logged_in
    if session[:user] == nil
      flash[:notice] = 'Please login to do that!'
      redirect_to "/sessions/new"
    end
  end
  
  def check_ownership(model_object, message = "You don't have permission to do that.")
    if model_object.user.id != session[:user]
      redirect_to "/"
      flash[:notice] = message
      return false
    else
      return true
    end
  end
end