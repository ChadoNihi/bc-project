class Photo < ActiveRecord::Base
  belongs_to :city
  has_and_belongs_to_many :tags, join_table: :taggings
  has_attached_file :image, :styles => { :list => "460x400>"}, :default_url => "/images/missing.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :city_id, numericality: { only_integer: true }
  validates :source, :author, length: { maximum: 255 }

  def all_tags
  	#self.tags.map(&:name).join(", ")
    self.tags.map {|tag| "<a href='#{Rails.application.routes.url_helpers.photos_path}'>#{tag.name}</a>"}.join(", ")
  end

  def all_tags=(l_of_t)
  	self.tags = l_of_t.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
end
