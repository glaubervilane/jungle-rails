class Admin::DashboardController < ApplicationController
  before_action :authenticate_user
  def show
    @product_count = Product.count
    @category_count = Category.count
    @categories = Category.all
  end
end
