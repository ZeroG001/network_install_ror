class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session # :exception

  # If a devise layout is used then use another layout. Format for specifying layouts is layout "layout_name". This can be done only in controllers
  layout :layout_by_controller
    

  before_filter :configure_permitted_parameters, if: :devise_controller?

	  protected

    def layout_by_controller 
      if devise_controller?
        "application_devise"
      else
        "application"
      end
    end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :office_number, :password, :password_confirmation, :paynum, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :office_number, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :paynum, :office_number) }
    devise_parameter_sanitizer.for(:update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :paynum, :office_number) }
  end

  private
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    forms_path
  end
end
