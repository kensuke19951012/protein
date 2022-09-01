class ApplicationController < ActionController::Base


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