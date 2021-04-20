class CartItemsController < ApplicationController
  def index
    @carts = CartItem.find(params[:id])

  end

  def create
  end

  def update
  end

  def destroy
  end

  private
  def cart_params
    params.require(:cart_item).permit(:name, :profile_image, :introduction)
  end
end
