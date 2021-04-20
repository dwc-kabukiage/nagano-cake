class Managers::ProductsController < ApplicationController

  def new
     @product = Product.new
  end

  def index
    @products = Product.all
    @posts = @products.page(params[:page]).reverse_order
  end

  def show
     
  end

  def create
     @product = Product.new(product_params)
     @product.save
     redirect_to_managers_products_path(@product.id)
  end

  def update

  end

  def edit

  end

end
