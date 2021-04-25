class OrdersController < ApplicationController
  def new
    @order = Order.new
    @deliveries = Delivery.where(member: current_member)
  end
  def confirm
    @cart_items = current_member.cart_items
    @total_price = 0
    @cart_items.each do |cart_item|
    @total_price += (cart_item.product.price * 1.1 * cart_item.number ).to_i
    end
    @order = Order.new(
      member: current_member,
      payment: params[:order][:payment],
      claim: @total_price + 800
    )
    if params[:order][:addresses] == "residence"
      @order.postcode = current_member.postcode
      @order.address = current_member.address
      @order.name = current_member.last_name + current_member.first_name

    elsif params[:order][:addresses] == "new_address"
      @order.postcode = params[:order][:postcode]
      @order.address     = params[:order][:address]
      @order.name        = params[:order][:name]
      @deliveries = Delivery.new
      @deliveries.member_id = current_member.id
      @deliveries.name =  @order.name
      @deliveries.postcode = @order.postcode
      @deliveries.address = @order.address
       @deliveries.save


    elsif params[:order][:addresses] == "member_deliveries"
      @order.postcode = Delivery.find(params[:order][:delivery_id]).postcode
      @order.address     =  Delivery.find(params[:order][:delivery_id]).address
      @order.name        =  Delivery.find(params[:order][:delivery_id]).name
    end
  end

  def create
    @order = current_member.orders.new(order_params)
    @order.save
    redirect_to complete_orders_path
    @cart_items = current_member.cart_items
    @cart_items.each do |cart_item|
    OrderDetail.create(
      product:  cart_item.product,
      order:    @order,
      number: cart_item.number,
      total_price: (cart_item.product.price * 1.1 * cart_item.number).to_i
    )
  end
  @cart_items.destroy_all
  end
  def index
    @orders = current_member.orders.page(params[:page]).per(10).order("id DESC")
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
   @total_price = (@order.claim - @order.freight )
  end
  private
  def address_params
   params.permit(:postcode, :address, :name)
  end
  def order_params
    params.require(:order).permit(:postcode, :address, :name, :payment, :claim)
  end
end