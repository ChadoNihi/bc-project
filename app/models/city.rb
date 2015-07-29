class City < ActiveRecord::Base
  include NextPrev

  belongs_to :region
  has_many :photos
  has_attached_file :title_photo, :styles => { :list => "500x400>"}, :default_url => "/images/missing.jpg"
  validates_attachment_content_type :title_photo, :content_type => /\Aimage\/.*\Z/
  validates :region, presence: true
  validates :name, length: { minimum: 1, maximum: 127 } #titleize
  validates :utcoffset, length: { minimum: 1, maximum: 6 }
  validates_format_of :utcoffset, :with => /\A[+|-]?[0-1]?\d(:[0-5][05]?)?\z/i
  validates :region_id, numericality: { only_integer: true }

  # mist, thunderstorm, moderate rain, clear, light intensity shower rain
  @maxTimeBetweenMeasures = 4800 #sec (== 80min)
  @weatherCondToIcon = {'sun' => '☀', 'cloud' => '☁'}
  @weather = {}

  def self.get_weather(city_name)
    city_weather_data = @weather[city_name.to_sym]
    return ['n'] if city_weather_data.nil?
    now = Time.now

    if (now - city_weather_data[:obtained_at]).to_i < @maxTimeBetweenMeasures
      return [city_weather_data[:temp], city_weather_data[:icon_url], city_weather_data[:descr]]
    else
      return ['n'] #let JS do ajax
    end
  end

  def self.set_weather(temp, city_name, icon_flname, obtained_at, descr)
    @weather[city_name.titleize.to_sym] = {:temp => temp, :icon_url => "http://openweathermap.org/img/w/#{icon_flname}.png", :obtained_at => obtained_at.to_i, :descr => descr}
  end
=begin
  def self.fst_cities_letters(cities)
  	letterToOccured = Hash[([*'A'..'Z']+[*'0'..'9']).map {|l| [l, false]}]
  	cities.each do |city|
  		fstLetter = city.name[0]
  		letterToOccured[fstLetter] = true unless letterToOccured[fstLetter]
  	end
    letterToOccured.keys.select { |k| letterToOccured[k] }
  end
=end
  def name=(s)
    super s.titleize
  end

  def self.find_user_city_in_db
    #userCity = request.location.city
    userCity = "Test"
    userCity = 'invisible' if userCity.nil?

    return userCity
  end
end