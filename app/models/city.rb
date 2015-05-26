class City < ActiveRecord::Base
  belongs_to :region
  has_many :photos
end
