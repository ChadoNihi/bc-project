class CitiesController < ApplicationController
  #http_basic_authenticate_with name: "ady", password: "123", except: [:index, :show, :weatherupdt]
  before_action :retrieve_city, only: [:show, :edit, :update, :destroy] #:user_city_fail

  def index
    @cities = []

    if params[:fst_letter] #not params[:fst_letter].nil?
      @cities += City.where("name like ?", params[:fst_letter]<<'%')
    elsif not params[:region_name].nil?
      @cities += City.where(region_id: (Region.find_by(name: params[:region_name]).id) )
    else
      @cities += City.all
    end

    #@fst_cities_letters = params[:fst_letter].nil? ? City.fst_cities_letters(@cities) : City.fst_cities_letters(City.all)
  end

  def show
    user_city_name = params[:id] if params[:ucity]

    if params[:id] == 'invisible'
      redirect_to cities_path, notice: "We cannot work out your location. Try find it on this page."
      return
    elsif @city.nil?
      redirect_to :back, notice: "Sorry, \"#{user_city_name}\" is not in our collection."
      return
    end

    @city_photos = @city.photos.order(sort_option + " " + sort_direction).paginate(:page => params[:page], :per_page => 3)
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

  def weatherupdt
    #if request.headers['origin'] ==
      City.set_weather(params[:temp], params[:name], params[:icon], params[:dt], params[:descr])
      redirect_to(:back)
  end

  def edit
  end

  def update
  end

  def destroy
  end
=begin
  def user_city_fail
    user_city_name = params[:name] if @city.nil?

    if @city.nil?
      flash.now[:notice] = "You're sneaky! We cannot work out your location."
    else
      flash.now[:notice] = "Sorry, #{user_city_name} is not in our collection."
    end
        
  end
=end

  private

  def retrieve_city
    begin
      @city = City.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @city = City.find_by(name: params[:id])
    end
  end

  def city_params
    params.require(:city).permit(:name, :region_id, :title_photo)
  end
end
