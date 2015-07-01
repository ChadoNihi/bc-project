class CitiesController < ApplicationController
  before_action :retrieve_city, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to cities_path, notice: 'city was successfully added.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def retrieve_city
    begin
      @city = City.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @city = City.where(params[:name]).first
    end
  end

  def city_params
    params.require(:city).permit(:name, :region_id, :title_photo)
  end
end
