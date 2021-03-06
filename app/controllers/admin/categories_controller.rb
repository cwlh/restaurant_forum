class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: [:update, :destroy]

  def index
    @categories = Category.all

    if params[:id]
      set_category
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
    if @category.update(category_params)
      flash[:notice] = "更新成功"
      redirect_to admin_categories_path
    else
      flash.now[:alert]="儲存失敗，請重新輸入"
      @categories = Category.all
      render :index
    end
  end

  def destroy
    @category.destroy
    flash[:alert]="已刪除!"
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
