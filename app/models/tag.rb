class Tag < ActiveRecord::Base
	has_and_belongs_to_many :photos, join_table: :taggings
end