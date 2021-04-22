class OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  def confirm
    @cart_items = current_member.cart_items
    @order = Order.new(
      member: current_member,
      payment: params[:order][:payment]
    )
    if params[:order][:addresses] == "residence"
      @order.postcode = current_member.postcode
      @order.address = current_member.address
      @order.name = current_member.last_name + current_member.first_name

    elsif params[:order][:addresses] == "new_address"
      @order.postcode = params[:order][:postcode]
      @order.address     = params[:order][:address]
      @order.name        = params[:order][:name]
    end
  end

  def create
    @order = current_member.orders.new(order_params)
    @order.save
    flash[:notice] = "ご注文が確定しました。"
    redirect_to complete_orders_path
    @cart_items = current_member.cart_items
    @cart_items.each do |cart_item|
    OrderDetail.create(
      product:  cart_item.product,
      order:    @order,
      number: cart_item.number,
    )
  end
  end
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
  private
  def order_params
    params.require(:order).permit(:postcode, :address, :name, :payment, :claim)
  end
end