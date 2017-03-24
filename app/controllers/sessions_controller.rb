class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to songs_path
    else
      flash[:errors] = ["Email & Password does not match."]
      redirect_to main_path
    end
  end

  def destroy
    session.clear
    redirect_to main_path
  end
end
