class HomesController < ApplicationController
  def top
    @products = Product.limit(4)
    @posts = @products.page(params[:page]).reverse_order
  end
  
  def about
  end
end
