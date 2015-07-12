class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper ApplicationHelper
  helper_method :sort_option, :sort_direction
  
  protected

  def sort_option
		['created_at','regions.name','cities.name','RANDOM()'].include?(params[:sort]) ? params[:sort] : "created_at"
	end

	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
end
