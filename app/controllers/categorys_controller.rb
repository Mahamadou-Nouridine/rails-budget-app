class CategorysController < ApplicationController
  def index
    @title = 'Categories'
    @rigth_el = 'menu'
    @left_el = 'search'
    @categories = Category.includes(:expenses).where(user_id: current_user.id)
  end

  def show
    @category = Category.includes(:expenses).find(params[:id])
    @transactions = @category.expenses
    # render 'show'
  end

  def new
    @category = Category.new
  end

  def create
    user = current_user
    @category = user.categorys.new(params.require(:category).permit(:name, :icon))
    if @category.save
      redirect_to categorys_path, notice: "Category created successfully"
    else
      redirect_to categorys_path, alert: "An error occured when creating the category"
    end
  end
end
