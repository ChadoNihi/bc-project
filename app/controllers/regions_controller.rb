class RegionsController < ApplicationController
  def index
  	@regions = Region.all
  end

  def show
  	begin
  		@region = Region.find(params[:id])
  	rescue ActiveRecord::RecordNotFound
     	@region = Region.where(params[:name]).first
    end
    @region_photos = Photo.joins(:city).where("cities.region_id = ?", @region.id).order(sort_option + " " + sort_direction).paginate(:page => params[:page], :per_page => 3)
  end
end
