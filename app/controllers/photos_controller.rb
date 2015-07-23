class PhotosController < ApplicationController
	http_basic_authenticate_with name: "ady", password: "123", except: [:index, :show]
	before_action :retrieve_photo, only: [:show, :edit, :update, :destroy]
	def index
		@photos = nil
		if params[:sort] == "cities.name"
			@photos = Photo.joins(:city).order("cities.name "+sort_direction)
		elsif params[:sort] == "regions.name"
			@photos = Photo.joins({:city => :region}).order("regions.name "+sort_direction)
		else
			@photos = Photo.order(sort_option + " " + sort_direction)
		end
		@photos = @photos.paginate(:page => params[:page])
	end

	def show
	end

	def new
		@photo = Photo.new
	end

	def create
		@photo = Photo.new(photo_params)

		respond_to do |format|
			if @photo.save
				format.html { redirect_to @photo, notice: 'photo was successfully created.' }
				format.json { render :show, status: :created, location: @photo }
			else
				format.html { render :new }
				format.json { render json: @photo.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
	end

	def update
		respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
		@photo.destroy
		respond_to do |format|
			format.html { redirect_to photos_path, notice: 'Photo was successfully deleted.' }
			format.json { head :no_content }
		end
	end

	private

	def retrieve_photo
		@photo = Photo.find(params[:id])
	end

	def photo_params
      params.require(:photo).permit(:title, :source, :author, :city_id, :image, :all_tags)
    end
end
