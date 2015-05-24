class Stores::AdminsController < Stores::StoresController

  def new
    @user = User.new
  end

end
