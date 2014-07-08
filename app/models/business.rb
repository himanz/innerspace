class Business < ActiveRecord::Base
	validates :name, presence: true
	validates :address, presence: true
	validates :pano, presence: true
	validates :heading, presence: true

	def self.by_letter(letter)
		where("name LIKE ?", "#{letter}%").order(:name)
	end
end
