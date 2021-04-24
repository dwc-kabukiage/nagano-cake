class Managers::OrdersController < ApplicationController
  
  def index
    @order = Order.all.order("id DESC")
  end
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @member = @order.member
   @total_price = (@order.claim - @order.freight )
  end
  def update 
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
      if @order.received_status == "入金確認"
        @order_details.update_all(make_status: 1)
      end
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
