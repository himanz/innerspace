class Business < ActiveRecord::Base
	attr_reader :image_remote_url
	scope :unique_by_country, lambda { select(:country).uniq.order("country ASC")}
  has_attached_file :image, styles: {
  	thumb: '100x100>',
  	medium: '500x300>'
  }

  before_save :image_remote_url

	validates :name, :pano, :heading, :cbp, :category_id, :latitude, :longitude, :state, :country, presence: true
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg"]

  extend FriendlyId
  friendly_id :name, use: :slugged

  def image_remote_url
  	self.image = URI.parse(streetview_image)
  	@image_remote_url = streetview_image
  	self.image_file_name = self.name
  end

	def self.by_letter(letter)
		where("name LIKE ?", "#{letter}%").order(:name)
	end

	def self.search(country, category)
		if country == "" && category == ""
			Business.all
		elsif country == ""
			by_category(category)
		elsif category == ""
			by_country(country)
		else
		  by_country(country).by_category(category)
	  end
	end

	def self.by_category(category)
		where(category_id: category)
	end

	def self.by_country(country)
		where("country LIKE ?", "#{country}")
	end

	def self.by_recent
		where("created_at >= ?", 1.week.ago.utc).order("created_at DESC")
	end

	def self.random_pick
		rand(1..(Business.count))
	end

	def formatted_address
		if address == nil && city == nil
			"#{state}"
		elsif address == nil
			"#{city}, #{state}"
		elsif city == nil
			"#{address}, #{state}"
		else
		  "#{address}, #{city}, #{state}"
	  end
	end

	def streetview_image
		"http://maps.googleapis.com/maps/api/streetview?size=500x300&heading=#{heading}&pitch=0&pano=#{pano}&sensor=false&key=#{ENV['google_maps_api_key']}"
	end

	def streetview_tour
		"https://maps.google.ca/maps?hl=en_uk&ll=#{latitude},#{longitude}&layer=c&panoid=#{pano}&cbp=#{cbp}&t=m&z=17&source=embed&output=svembed"
	end
end
