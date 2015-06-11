class Region < ActiveRecord::Base
	has_many :cities
	validates :name, length: { minimum: 1, maximum: 127 }
end
