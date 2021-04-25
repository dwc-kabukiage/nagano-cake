class Managers::MembersController < ApplicationController

  before_action :authenticate_manager!

  def index
    @members = Member.all
    @posts = @members.page(params[:page]).reverse_order
  end

  def show
    @member = Member.find(params[:id])
    # @order = Order.find(params[:id])
    # @order_details = @order.order_details
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    if @member.save
    redirect_to managers_members_path(@member)
    else
    @member = Member.find(params[:id])
    render :edit
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  private

  def member_params
    params.require(:member).permit(:first_name, :last_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email, :is_deleted)
  end

end
