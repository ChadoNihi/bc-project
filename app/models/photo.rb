class Photo < ActiveRecord::Base
  belongs_to :city
  has_attached_file :image, :default_url => "/images/missing.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
