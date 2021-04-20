class ProductsController < ApplicationController

  def index
    @products = Product.all
    @posts = @products.page(params[:page]).reverse_order
  end

  def show
    @product = Product.find(params[:id])
    # @cart_item = Cart_item.new
  end

end
