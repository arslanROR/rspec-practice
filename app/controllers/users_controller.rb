class UsersController < ApplicationController
  def index
    @users = User.all
    render json: {status: 200}
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: {status: 200}
    else
      render json: {status: 404}
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      render json: {status: 200}
    else
      render json: {status: 404}
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: {status: 200}
    else
      render json: {status: 404}
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
