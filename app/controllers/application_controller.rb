class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  helper_method :check_login
  
  def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :name, :email, :password, :password_confirmation) }
  end

  private
  def check_login
      if !user_signed_in?
        
        flash[:notice] = "You need to be login first"
        
        redirect_to new_user_session_path
      end
  end  

end
