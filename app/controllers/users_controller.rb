class UsersController < ApplicationController
  before_action :move_to_index, only: [:edit]

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def move_to_index
    @user = User.find(params[:id])
    return if current_user.id == @user.id
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:center_code, :center_name, :yearly_delivery, :consumption_type_id)
  end
end
