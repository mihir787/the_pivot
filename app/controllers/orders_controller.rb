class OrdersController < ApplicationController
  #Take the cart contents
  #Pass that to a PORO - returns a hash where keys are store id, values are
  # checkout_name/id: { store1: { photo1 }}
  def create
    @order = Order.new(order_params)
    if @order.save
      @cart.contents.keys.each do |photo_id|
        store = Photo.find(photo_id.to_i).store
        @order.order_photos.create(photo_id: photo_id.to_i, order_id: @order.id)
        @order.stores << store
      end
      UserNotifier.order_confirmation(@order).deliver_now
      @order.stores.each do |store|
        @admin = store.users.first
        UserNotifier.order_to_store_admin(@admin).deliver_now
      end
      flash[:notice] = "Order Successfully Placed"
      redirect_to orders_payment_path
    else
      flash[:error] = "Grow your beard, try again"
      redirect_to checkout_path
    end
    @cart.clear
  end


  def payment

  end

  private

  def order_params
    params.require(:order).permit(:user_id, :subtotal, :photo_id, :status)
  end
end
