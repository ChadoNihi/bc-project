class Tag < ActiveRecord::Base
	include NextPrev
	
	has_and_belongs_to_many :photos, join_table: :taggings
	validates :name, length: { minimum: 1, maximum: 127 }
end