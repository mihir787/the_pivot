class Stores::StoresController < ApplicationController
  helper_method :current_store
  helper_method :first_store_admin
  before_action :store_not_found

  def current_store
    @current_store ||= Store.find_by(slug: params[:store])
  end

  def store_not_found
    redirect_to root_path unless current_store
  end

  def first_store_admin
    redirect_to store_admin_dashboard_path(id: current_user) if current_user != current_store.users.first
  end

  def edit
    @store = current_store
  end

  def update
    @store = current_store
    if @store.update(store_params)
      flash[:notice] = "#{@store.name} Updated"
      redirect_to store_admin_dashboard_path(current_store)
    else
      flash[:error] = @store.errors.full_messages.join(", ")
      render :edit
    end
  end

  private

  def store_params
    params.require(:store).permit(:name,
                                 :description,
                                 :image)
  end
end
