require 'spec_helper'

feature 'Business management' do
	scenario "add a new business" do
		default = create(:default)

	  visit new_business_path
	  fill_in 'Name', with: default.name
	  fill_in 'Address', with: default.address
	  click_button 'Submit'

	  visit new_business_path
	  expect {
	  	fill_in 'Name', with: 'Default Cafe'
	  	fill_in 'Address', with: '1 Default Drive'
	  	click_button 'Submit'
	  }.to change(Business, :count).by(1)
	  expect(current_path).to eq business_path
	  expect(page).to have_content "Business was created successfully"
	  within 'h1' do
	  	expect(page).to have_content 'Businesses'
	  end
	end
end