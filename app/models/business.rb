class Business < ActiveRecord::Base
	belongs_to :pin

	validates :name, presence: true
	validates :address, presence: true
	validates :pano, presence: true
	validates :heading, presence: true
	validates :cbp, presence: true
  validates :category_id, presence: true


	def self.by_letter(letter)
		where("name LIKE ?", "#{letter}%").order(:name)
	end

	def self.by_category(category)
		where(category_id: category)
	end

	def streetview_image
		"http://maps.googleapis.com/maps/api/streetview?size=500x300&heading=#{heading}&pitch=0&pano=#{pano}&sensor=false&key=#{ENV['google_maps_api_key']}"
	end

	# def streetview_tour
	# 	"https://maps.google.ca/maps?hl=en_uk&ll=#{business.latitude},#{business.longitude}&layer=c&panoid=#{business.pano}&cbp=#{business.cbp}&t=m&z=17&source=embed&output=svembed"
	# end
end
