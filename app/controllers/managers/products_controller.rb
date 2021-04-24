class Managers::ProductsController < ApplicationController

  def new
     @product = Product.new
  end

  def index
    @products = Product.all
    @posts = @products.page.per(10)
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
     @product = Product.new(product_params)
     @product.save
     redirect_to managers_product_path(@product)
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to managers_products_path(@product)
  end

  def edit
    @product = Product.find(params[:id])
  end

 private

  def product_params
    params.require(:product).permit(:image, :name, :body, :category_id, :price, :is_active)
  end

end
