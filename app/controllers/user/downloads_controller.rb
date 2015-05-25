class User::DownloadsController < User::BaseController
  def index
    @photos = current_user.photos.uniq
  end
end