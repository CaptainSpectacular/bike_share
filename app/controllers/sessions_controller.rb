class SessionsController < ApplicationController
  def new
    session[:user_id] = nil
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password]) && user.admin?
      session[:user_id] = user.id
      redirect_to admin_dashboard_path
    elsif user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
