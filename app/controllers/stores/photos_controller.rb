class Stores::PhotosController < Stores::StoresController
  def index
    @photos = current_store.photos
  end
end