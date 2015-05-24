class Stores::AdminsController < Stores::StoresController

  def new
    @user = User.new
  end

  def create
    if current_user == current_store.users.first
      @user = current_store.users.new(user_params)
      @user.role = 2
      @user.save
      flash[:message] = "New store admin has been created."
      redirect_to store_admins_dashboard_path(id: current_user.id)
    else
      flash[:error] = "You do not have proper admin credentials to perform this action."
      redirect_to store_admins_dashboard_path(id: current_user.id)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    if current_user == current_store.users.first
      @users = current_store.users
    else
      flash[:error] = "You do not have proper admin credentials to view this page."
      redirect_to store_admins_dashboard_path(id: current_user.id)
    end
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
