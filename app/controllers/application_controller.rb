class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

#   before_action :authenticate_admin!


 def configure_permitted_parameters
 devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :end_user_last_name, :end_user_first_name, :end_user_last_kana ,:end_user_first_kana, :zip, :address, :end_user_phone ])
 end


end

