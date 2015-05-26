class StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def edit
    @store = store
  end

  def update
    @store = store
    if @store.update(store_params)
      flash[:notice] = "#{@store.name} Updated"
      redirect_to store_admin_dashboard_path(store, current_user)
    else
      flash[:error] = @store.errors.full_messages.join(", ")
      render :edit
    end
  end

  private

  def store_params
    params.require(:store).permit(:name, :description, :image)
  end

  def store
    @store ||= Store.find_by!(slug: params[:id])
  end
end