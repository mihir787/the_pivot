class Stores::AdminsController < Stores::StoresController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to store_admins_dashboard_path(id: @user)
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                 :username,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :picture)

  end



end
