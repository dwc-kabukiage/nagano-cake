class Managers::OrderDetailsController < ApplicationController
    before_action :authenticate_manager!
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      @order = @order_detail.order
      if @order_detail.make_status == "製作中"
        @order.update(received_status: 2)
      elsif @order.order_details.count == @order.order_details.where(make_status: "製作完了").count
         @order.update(received_status: 3)
      end
      flash[:success] = "制作ステータスを変更しました"
      redirect_to managers_order_path(@order_detail.order)
    else
      render "show"
    end
  end

    private
    def order_detail_params
        params.require(:order_detail).permit(:make_status)
    end
end
