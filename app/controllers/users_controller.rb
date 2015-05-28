class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.roles << Role.find_by(name: 'registered_user')
      session[:user_id] = @user.id
      UserNotifier.send_signup_email(@user).deliver
      flash[:message] = "User has been successfully created!"
      redirect_to user_path
    else
      flash[:errors] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user
    else
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    @user = current_user
    if @user.destroy
      flash[:message] = "Account has been removed"
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages
      render @user
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
