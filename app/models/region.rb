class Region < ActiveRecord::Base
	has_many :cities
	validates :name, length: { minimum: 1, maximum: 127 }

  def next
    Region.where("id > ?", id).first || Region.minimum(:id)
  end

  def prev
    Region.where("id < ?", id).last || Region.maximum(:id)
  end
end