# frozen_string_literal: true

class Members::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
 before_action :reject_user, only: [:create]

  protected

  def reject_member
    @member = Member.find_by(email: params[:member][:email].downcase)
    @valid_pass = @member.valid_password?(params[:member][:password])
    @valid_member = @member.active_for_authentication?
    
    if @member && @valid_pass && !@valid_member
      # p "退会済処理"
      flash[:error] = "退会済みです。"
      redirect_to root_path
      
    else
      flash[:error] = "必須項目を入力してください。"
    end
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
