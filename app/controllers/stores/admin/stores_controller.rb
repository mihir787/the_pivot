class Stores::Admin::StoresController < ApplicationController
  helper_method :current_store
  before_action :require_store_admin
  before_action :store_not_found

  def current_store
    @current_store ||= Store.find_by(slug: params[:store])
  end

  def store_not_found
    redirect_to root_path unless current_store
  end

  def require_store_admin
    redirect_to "/errors/file_not_found" unless current_store_admin?
  end
end