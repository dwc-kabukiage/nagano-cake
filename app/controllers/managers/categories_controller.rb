class Managers::CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    @category.save
    redirect_to managers_categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to managers_categories_path(@category)
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
