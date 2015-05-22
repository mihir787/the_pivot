class User::OrdersController < User::BaseController
  def index
    @orders = current_user.orders
    @order_photos = current_user.order_photos
  end

  def show
    @order = current_user.orders.find(params[:id])
  end
end