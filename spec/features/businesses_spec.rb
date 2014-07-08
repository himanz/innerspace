require 'spec_helper'

feature 'Business management' do
	before :each do
		@default = create(:default)
	end

	scenario "add a new business" do		
	  visit new_business_path
	  fill_in 'Name', with: @default.name
	  fill_in 'Address', with: @default.address
	  click_button 'Submit'

	  visit new_business_path
	  expect {
	  	fill_in 'Name', with: 'Default Cafe'
	  	fill_in 'Address', with: '1 Default Drive'
	  	click_button 'Submit'
	  }.to change(Business, :count).by(1)
	  expect(current_path).to eq business_path((@default.id + 2))
	  expect(page).to have_content "Business was successfully created"
	  within 'h1' do
	  	expect(page).to have_content 'Default Cafe'
	  end
	end

	scenario "edit a business"
	scenario "delete a business"
end