class RegionsController < ApplicationController
  def index
  end

  def show
  	begin
  		@region = Region.find(params[:id])
  	rescue ActiveRecord::RecordNotFound
     	@region = Region.where(params[:name]).first
    end
  end
end
