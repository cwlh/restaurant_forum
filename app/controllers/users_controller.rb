class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
  end

  def edit
    #只有自己能編輯自己的資料
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end

  def update
    @user.update(user_paramas)
    flash[:notice]="更新成功"
    redirect_to user_path(@user)
  end

  private

  def user_paramas
    params.require(:user).permit(:name, :intro)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
