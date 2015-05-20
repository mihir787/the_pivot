class CheckoutsController < ApplicationController

  def create
    photo = Photo.find(params[:photo_id])
    @cart.add_photo(photo.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You now have #{photo.title} in your cart.  "
    redirect_to categories_path
  end


  def show
    @photos = @cart.find_photos
    @photo_quantities = @cart.contents
  end

  def confirmation
    @photos = @cart.find_valid_photos
    @photo_quantities = @cart.contents
    if @photos.empty?
      flash[:errors] = "Reality Check! Cart can't be empty!"
      redirect_to categories_path
    end
  end

  def remove
    photo = @cart.remove_photo(params[:photo_id])
    redirect_to checkout_path
  end
end
