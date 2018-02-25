class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update]
  before_action :require_admin, only: [:index, :show, :update]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'You was successfully signed up.'
    else
      redirect_to signup_url
    end
  end

  def update
    respond_to do |format|
      if @user.update_attributes(special_user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { redirect_to users_path }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:login, :password, :password_confirmation)
  end

  def special_user_params
    params.require(:user).permit(:role, :special_ability)
  end

end