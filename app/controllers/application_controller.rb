class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource) #ログイン後画面遷移先
    case resource

    when Member
      root_path
    when Manager
      admin_top_path
    end
  end
end
