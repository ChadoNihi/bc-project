class City < ActiveRecord::Base
  belongs_to :region
  has_many :photos
  has_attached_file :title_photo, :styles => { :list => "500x400>"}, :default_url => "/images/missing.jpg"
  validates_attachment_content_type :title_photo, :content_type => /\Aimage\/.*\Z/
  validates :region, presence: true
  validates :name, length: { minimum: 1, maximum: 127 }
  validates :utcoffset, length: { minimum: 1, maximum: 6 }
  validates_format_of :utcoffset, :with => /\A[+|-]?[0-1]?\d(:[0-5][05]?)?\z/i
  validates :region_id, numericality: { only_integer: true }

  def self.fst_cities_letters(cities)
  	letterToOccured = Hash[([*'A'..'Z']+[*'0'..'9']).map {|l| [l, false]}]
  	cities.each do |city|
  		fstLetter = city.name[0]
  		letterToOccured[fstLetter] = true unless letterToOccured[fstLetter]
  	end
    letterToOccured.keys.select { |k| letterToOccured[k] }
  end

  def name=(s)
    super s.titleize
  end
end