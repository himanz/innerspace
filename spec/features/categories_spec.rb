require 'spec_helper'

feature 'Category management' do
	before :each do
		@default = create(:default_category)
	end

	scenario "add a new category" do
		visit new_category_path
		expect {
			fill_in 'Name', with: @default.name
			click_button 'Submit'
		}.to change(Category, :count).by(1)
		expect(current_path).to eq category_path(@default.id + 1)
		expect(page).to have_content "Category was successfully created"
		within 'h1' do
			expect(page).to have_content 'Hotel'
		end
	end
	scenario "edit a category"
	scenario "delete a category"
end