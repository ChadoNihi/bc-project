class Photo < ActiveRecord::Base
  belongs_to :city
  has_and_belongs_to_many :tags, join_table: :taggings
  has_attached_file :image, :default_url => "/images/missing.jpg"
  validates_attachment :image, :presence => true,
    :content_type => { :content_type => /\Aimage/ }
  validates :city, presence: true
  validates :city_id, numericality: { only_integer: true }
  validates :source, :author, length: { maximum: 255 }

  before_safe :strip_meta
  after_safe :spawn_for_target_resolutions

  RESOLUTIONS = [480, 300, 740]

  def all_tags
  	#self.tags.map(&:name).join(", ")
    self.tags.map {|tag| "<a href='#{Rails.application.routes.url_helpers.tag_path(tag)}'>#{tag.name}</a>"}.join(", ")
  end

  def all_tags=(l_of_t)
  	self.tags = l_of_t.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  private

  def strip_meta
    MiniMagick::Image.new(self.upload.queued_for_write[:original].path).strip
  end

  def spawn_for_target_resolutions
    RESOLUTIONS.each {|res| self.imgmagick_convert(res)} #self.image.url
  end

  def imgmagick_convert(res)
    MiniMagick::Tool::Convert.new do |convert|
      convert << self.image.url
      convert.merge! ["-resize", res, ...]
      convert << "output.jpg"
    end
  end
end