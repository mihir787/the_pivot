class Stores::Admin::PhotosController < Stores::Admin::StoresController
  def index
    @photos = current_store.photos
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.store_id = current_store.id
    if @photo.save
      flash[:notice] = "#{@photo.title} created!"
      redirect_to store_admin_photos_path
    else
      flash[:error] = @photo.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      flash[:notice] = "#{@photo.title} Updated"
      redirect_to store_admin_photo_path(current_store, @photo)
    else
      flash[:error] = @photo.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to store_admin_photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:title,
                                 :description,
                                 :price,
                                 :status,
                                 :image,
                                 :category_ids, 
                                 :store_id)
  end
end




  