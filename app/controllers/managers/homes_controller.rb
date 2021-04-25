class Managers::HomesController < ApplicationController
    before_action :authenticate_manager!
  def top
    @orders = Order.page(params[:page]).per(10).order("id DESC")
  end
end
