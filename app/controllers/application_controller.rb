class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  	def after_sign_in_path_for(resource)
  		if !current_user.profile
  			profile_new_path
  		else
  			root_path
  		end
  	end

    private
    def current_user
      @_current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
    end 

end
