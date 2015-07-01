class City < ActiveRecord::Base
  belongs_to :region
  has_many :photos
  has_attached_file :title_photo, :styles => { :list => "500x400>"}, :default_url => "/images/missing.jpg"
  validates_attachment_content_type :title_photo, :content_type => /\Aimage\/.*\Z/
  validates :region, presence: true
  validates :name, length: { minimum: 1, maximum: 127 }
  validates :region_id, numericality: { only_integer: true }
end