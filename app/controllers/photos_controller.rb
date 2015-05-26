class PhotosController < ApplicationController
	before_action :retrieve_photo, only: [:show, :edit, :update, :destroy]
	def index
		@photos = Photo.all
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
      params.require(:photo).permit(:title, :source, :author, :city_id, :image)
    end
end
