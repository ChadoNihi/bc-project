class TagsController < ApplicationController
  before_action :retrieve_tag, only: :show
  
  def index
  	@tags = params[:fst_letter] ? Tag.where("name like ?", params[:fst_letter]<<'%') : Tag.all
  end

  def show
    @tag_photos = @tag.photos.order(sort_option + " " + sort_direction).paginate(:page => params[:page])
  end

  private

  def retrieve_tag
    begin
      @tag = Tag.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @tag = Tag.find_by(name: params[:id])
    end
  end
end
