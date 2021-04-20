class Managers::HomesController < ApplicationController
  before_action :move_to_signed_in

  def top
    @members = Member.all.includes(:orders)
    @orders = Order.all
    p @orders
  end

  private
  def move_to_signed_in
    unless manager_signed_in?
      #サインインしていないユーザーはログインページが表示される
      redirect_to  new_manager_session_path
    end
  end
end
