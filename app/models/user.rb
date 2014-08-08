class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 # before_filter :configure_permitted_parameters, if: :devise_controller?

	#   protected

	#   def configure_permitted_parameters
	#   	devise_parameter_sanitizer.for(:sign_up) << :first_name
	#   	devise_parameter_sanitizer.for(:sign_up) << :last_name
	#   	devise_parameter_sanitizer.for(:sign_up) << :profile_name
	#   end

end
