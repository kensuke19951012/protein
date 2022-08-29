class ApplicationController < ActionController::Base
 #before_action :authenticate_member!, except: [:top, :about, :public_action, :sign_in]
 #before_action :configure_permitted_parameters, if: :devise_controller?


 def after_sign_in_path_for(resource)
    if current_member
      posts_path(current_member)
    elsif current_admin
      admin_posts_path
    end

 end


 def after_sign_out_path_for(resource)
    root_path
 end


protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

end