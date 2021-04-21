class DeliveriesController < ApplicationController
  def index
   @deliveries = current_member.deliveries
   @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.member_id = current_member.id
    @delivery.save
    flash[:success] = "successfuly"
    redirect_to deliveries_path(@delivery)
  end

  def update
    @delivery = Delivery.find(params[:id])
   if @delivery.update(delivery_params)
     flash[:success] = "successfuly"
     redirect_to members_path(@delivery)
   else
     rennder :edit
   end
  end

  def edit
     @delivery = Delivery.find(params[:id])
  end

  def destroy
    delivery = Delivery.find(params[:id])
    delivery.destroy
    redirect_to deliveries_path
  end


 private
  def delivery_params
   params.require(:delivery).permit(:postcode, :address, :name)
  end
end

