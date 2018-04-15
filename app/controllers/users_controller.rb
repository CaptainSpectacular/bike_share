class UsersController < ApplicationController
  def show
    if current_user || current_admin
      @user = current_user
    else
      render file: '/public/404'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Account created successfully"
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :role)
  end
end
