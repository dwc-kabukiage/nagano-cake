class CartItemsController < ApplicationController
  before_action :authenticate_member!,except: [:top]

  def index
    @cart_items = current_member.cart_items

    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += (cart_item.product.price * 1.1 * cart_item.number).to_i
    end
  end

  def create
    @cart = CartItem.new(cart_params)
    existing_cart_item = current_member.cart_items.find_by(product_id: cart_params[:product_id])
    if existing_cart_item
      existing_cart_item.update(number: existing_cart_item.number = cart_params[:number].to_i)
    else
      @cart.member_id = current_member.id
      @cart.save
    end
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_params
    params.require(:cart_item).permit(:number, :product_id)
  end
end
