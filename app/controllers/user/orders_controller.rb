class User::OrdersController < User::BaseController
  def index
    @orders = current_user.orders
    @photos = current_user.photos.uniq
  end

  def show
    @order = current_user.orders.find(params[:id])
  end
end