class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource) #ログイン後画面遷移先
    case resource

    when Member
      members_path(current_member)
    when Manager
      managers_path
    end
  end

  def after_sign_out_path_for(resource_or_scope) #ログアウト後画面遷移先
    if resource_or_scope == :member
        root_path
    elsif resource_or_scope == :manager
        new_manager_session_path
    else
        root_path
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :is_deleted])
  end
end
