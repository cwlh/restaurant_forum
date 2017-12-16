class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @categories = Category.all

    if params[:id]
      @category = Category.find(params[:id])
    else
      @category = Category.new
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice]="成功新增餐廳種類"
      redirect_to admin_categories_path
    else
      flash.now[:alert]="儲存失敗，請重新輸入"
      @categories = Category.all
      render :index
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "更新成功"
      redirect_to admin_categories_path
    else

      @categories = Category.all
      render :index
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
