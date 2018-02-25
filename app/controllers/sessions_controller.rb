class SessionsController < ApplicationController

  def new
  end

  def create
    puts params[:login]
    user = User.find_by_login(params[:session][:login])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      redirect_to login_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
