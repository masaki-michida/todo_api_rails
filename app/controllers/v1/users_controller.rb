class V1::UsersController < ApplicationController
  
  def index
    if params[:uid]
      # find_byじゃなくていいのでは=uidはstringで定義していたので
      current_user = User.find_by(uid: params[:uid])
      render json: current_user
    else
      users = User.all
      render json: users
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:uid)
  end

end
