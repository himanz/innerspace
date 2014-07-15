require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

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
		expect(page).to have_content 'Hotel'
	end

	scenario "edit a category" do
		visit edit_category_path(@default)
		expect{
			fill_in 'Name', with: 'College'
			click_button 'Submit'
		}.to_not change(Category, :count)
		expect(current_path).to eq category_path(@default)
		expect(page).to have_content "Category was successfully updated"
		expect(page).to have_content 'College'
	end

	scenario "delete a category" do
		visit edit_category_path(@default)
		expect{
			click_link 'Delete'
		}.to change(Category, :count).by(-1)
		expect(current_path).to eq categories_path
		expect(page).to have_content "Category was successfully deleted"
		expect(page).to have_content "Index"
	end
end