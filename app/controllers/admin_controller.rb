class AdminController < ActionController::Base
  layout 'admin/application'
  # before_action :authenticate_admin!

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # layout Proc.new { |controller| controller.devise_controller? ? 'user' : 'application' }

  protected
 
  # def configure_permitted_parameters
  #   added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :name, :phone, :gender]
  #   devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  #   devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  # end
end