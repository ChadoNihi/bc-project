class Region < ActiveRecord::Base
	include NextPrev
	
	has_many :cities
	validates :name, length: { minimum: 1, maximum: 127 }
end