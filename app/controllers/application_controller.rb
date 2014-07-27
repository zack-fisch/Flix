class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_signin
  	unless current_user
  		redirect_to new_session_url, alert: 'Please sign in'
  	end
  end
end
