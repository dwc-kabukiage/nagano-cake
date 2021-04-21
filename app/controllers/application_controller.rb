class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :is_deleted])
  end
  
  def after_sign_in_path_for(resource) #ログイン後画面遷移先
    case resource

    when Member
      members_path(current_member)
    when Manager
      managers_path
    end
  end
end
