class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
  end

  def user_params
    params.require(:user).permit(:username, :description)
  end
end
