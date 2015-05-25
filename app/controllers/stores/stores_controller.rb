class Stores::StoresController < ApplicationController
  helper_method :current_store
  before_action :require_store_admin
  before_action :store_not_found
  before_action :first_store_admin

  def current_store
    @current_store ||= Store.find_by(slug: params[:store])
  end

  def store_not_found
    redirect_to root_path unless current_store
  end

  def first_store_admin
    redirect_to store_admins_dashboard_path(id: current_user) if current_user != current_store.users.first
  end

  def require_store_admin
    redirect_to "/errors/file_not_found" unless current_store_admin?
  end

end
