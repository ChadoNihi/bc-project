class City < ActiveRecord::Base
  belongs_to :region
  has_many :photos
  validates :name, length: { minimum: 1, maximum: 127 }
  validates :region_id, numericality: { only_integer: true }
end
