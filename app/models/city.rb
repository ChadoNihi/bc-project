class City < ActiveRecord::Base
  belongs_to :region
  has_many :photos
  has_attached_file :title_photo, :styles => { :list => "500x400>"}, :default_url => "/images/missing.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :name, length: { minimum: 1, maximum: 127 }
  validates :region_id, numericality: { only_integer: true }
end