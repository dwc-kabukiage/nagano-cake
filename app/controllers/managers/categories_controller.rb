class Managers::CategoriesController < ApplicationController

  before_action :authenticate_manager!

  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
   if @category.save
    redirect_to managers_categories_path
   else
    @categories = Category.all
    render :index
   end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
       redirect_to managers_categories_path(@category)
    else
      @category = Category.find(params[:id])
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
