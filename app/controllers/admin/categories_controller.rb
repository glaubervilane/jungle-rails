class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_categories_path, notice: 'Category created!'
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path, notice: 'Category deleted!'
  end  

  private

  def category_params
    params.require(:category).permit(:name)
  end
end