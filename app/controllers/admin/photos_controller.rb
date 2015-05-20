class Admin::PhotosController < Admin::BaseController
  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @categories = Category.all
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      categories = params[:photo][:category_ids].reject(&:empty?)
      categories.each do |id|
        @photo.categories << Category.find(id)
      end
      flash[:notice] = "#{@photo.title} created!"
      redirect_to admin_photo_path(@photo)
    else
      flash[:error] = @photo.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @photo = Photo.find(params[:id])
    @categories = Category.all
  end

  def update
    @photo = Photo.find(params[:id])
    categories = params[:photo][:category_ids].reject(&:empty?)
    if @photo.update(photo_params)
      @photo.categories.destroy_all
      categories.each do |id|
        @photo.categories << Category.find(id)
      end
      flash[:notice] = "#{@photo.title} Updated"
      redirect_to admin_photo_path(@photo)
    else
      flash[:error] = @photo.errors.full_messages.join(", ")
      render :edit
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title,
                                 :description,
                                 :price,
                                 :status,
                                 :image,
                                 :category_ids)
  end
end
