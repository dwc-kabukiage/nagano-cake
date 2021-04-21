class Managers::OrdersController < ApplicationController
  
  def index
    @order = Order.all
  end
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @member = @order.member
  end
  def update 
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:success] = "変更しました"
      redirect_to managers_order_path(@order)
    else
      render "show"
    end
  end
  private
  def order_params
     params.require(:order).permit(:received_status)
  end
end
