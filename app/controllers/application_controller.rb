class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ActionView::Helpers::TextHelper


  before_action :load_cart
  before_action :authorize!

  helper_method :current_user
  helper_method :logged_in?

  add_flash_types :success, :info, :warning, :danger

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def load_cart
    @cart ||= Cart.new(session[:cart])
  end

  def current_store
    @current_store ||= Store.find_by(slug: params[:store])
  end

  def current_permission
    @current_permission ||= Permissions.new(current_user)
  end 

  def allow?
    current_permission.allow?(params[:controller], params[:action], params[:id])
  end

  def authorize!
    unless allow?
      redirect_to root_url, danger: "You are not authorized to visit this page"
    end
  end
end
