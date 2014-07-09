require 'spec_helper'

feature 'Category management' do
	before :each do
		@default = create(:category_default)
	end
	
	scenario "add a new category"
	scenario "edit a category"
	scenario "delete a category"
end