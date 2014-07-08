class Business < ActiveRecord::Base
	belongs_to :pin

	validates :name, presence: true
	validates :address, presence: true
	validates :pano, presence: true
	validates :heading, presence: true
	validates :cbp, presence: true
  validates :category, presence: true


	def self.by_letter(letter)
		where("name LIKE ?", "#{letter}%").order(:name)
	end
end
