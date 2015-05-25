class Stores::AdminController < Stores::StoresController
  before_action :first_store_admin, except: [:index, :show]

  def index
    @users = current_store.users
  end
  
  def new
    @user = User.new
  end

  def create
    @user = current_store.users.new(user_params)
    @user.role = 2
    if @user.save
      UserNotifier.send_store_admin(@user).deliver_now
      flash[:message] = "New store admin has been created."
      redirect_to store_admin_dashboard_path(id: current_user)
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      redirect_to store_admin_dashboard_path(id: current_user)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      flash[:message] = "Store admin has been deleted."
      redirect_to store_admin_index_path(store: current_store)
    else
      flash[:error] = user.errors.full_messages
      redirect_to store_admin_index_path(store: current_store)
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