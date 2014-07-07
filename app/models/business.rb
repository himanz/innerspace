class Business < ActiveRecord::Base
	validates :name, presence: true
	validates :address, presence: true

	def self.by_letter(letter)
		where("name LIKE ?", "#{letter}%").order(:name)
	end
end
