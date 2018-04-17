class UsersController < ApplicationController
  before_action :correct_user, only: [:edit]

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
    if params[:user][:password] == params[:user][:confirm_password]
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Account created successfully"
        redirect_to dashboard_path
      else
        render :new
      end
    else
      flash[:danger] = 'Passwords do not match'
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      flash[:success] = "Your account was successfully updated, #{current_user.username}"
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :role, :password_confirmation)
  end
end
