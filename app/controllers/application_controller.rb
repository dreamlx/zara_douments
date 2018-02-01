class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  #protect_from_forgery with: :exception

  protect_from_forgery

  def access_denied(exception)
    redirect_to admin_organizations_path, :alert => exception.message
  end
end
