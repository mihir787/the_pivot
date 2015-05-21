class Stores::PhotosController < Stores::StoresController
  def index
    @photos = current_store.photos
  end

  def show
    @photo = Photo.find(params[:id])
  end
end