class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ActionView::Helpers::TextHelper


  before_action :load_cart
  helper_method :current_user
  helper_method :logged_in?
  helper_method :current_store_admin?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def current_store_admin?
    current_store.users.find(current_user.id) && current_user.store_admin?
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
end
