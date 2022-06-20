class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout Proc.new { |controller| controller.devise_controller? ? 'user' : 'application' }

  helper_method :build_ransack
  helper_method :build_number_cart_items
  def page_404
      render file: 'public/404.html', layout: false
  end

  def build_ransack
    @q = Product.ransack(params[:q])
  end

  def build_number_cart_items
    return 0 if current_user.blank? || current_cart.blank?

    @cart_items_count = current_cart.cart_items.count
  end

  def current_cart
    return unless current_user
    
    @current_cart ||= current_user.cart
  end

  protected
 
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :name, :phone, :gender]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
