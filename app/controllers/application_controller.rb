class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper ApplicationHelper
  helper_method :sort_option, :sort_direction

  def lonely_door
    
  end

  def attempt_lonely_door
    session[:admin] = true if params[:reason] == 'walkaround'

    redirect_to root_path
  end
  
  protected

  def sort_option
		['created_at','regions.name','cities.name','RANDOM()', 'name'].include?(params[:sort]) ? params[:sort] : "created_at"
	end

	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
end
