class Managers::ProductsController < ApplicationController

  before_action :authenticate_manager!

  def new
     @product = Product.new
  end

  def index
    @products = Product.all
    @posts = @products.page(params[:page]).per(10)
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
    redirect_to managers_product_path(@product)
    else
    render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    if @product.save
        redirect_to managers_products_path(@product)
    else
       @product = Product.find(params[:id])
       render :edit
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

 private

  def product_params
    params.require(:product).permit(:image, :name, :body, :category_id, :price, :is_active)
  end

end
