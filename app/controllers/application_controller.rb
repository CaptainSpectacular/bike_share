class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_admin, :registered_user
  before_action :set_cart

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin
    current_user && current_user.admin?
  end

  def correct_user
    render file: '/public/404' if current_user.id != params[:id].to_i
  end

  def registered_user
    current_user && current_user.registered?
  end

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end
end
