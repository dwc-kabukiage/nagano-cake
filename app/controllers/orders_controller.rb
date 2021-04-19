class OrdersController < ApplicationController
  def new
    @order = Order.new
  end


  def create
    @order = Order.new(order_params)
    @order.save
    flash[:notice] = "ご注文が確定しました。"
    redirect_to orders_path
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end
  private
  def order_params
    params.require(:order).permit(:postcode, :address, :name, :payment, :claim)
  end
end
