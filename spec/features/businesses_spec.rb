require 'spec_helper'

feature 'Business management' do
	before :each do
		@default = create(:default)
	end

	scenario "add a new business" do		
		@category_array = []
		2.times do
       hold = generate :sequence_category
       @category_array.push(hold)
		end

	  # visit new_business_path
	  # fill_in 'Name', with: @default.name
	  # fill_in 'Address', with: @default.address
	  # click_button 'Submit'

	  visit new_business_path
	  expect {
	  	fill_in 'Name', with: @default.name
	  	fill_in 'Address', with: @default.address
	  	fill_in 'Heading', with: @default.heading
	  	fill_in 'Pano', with: @default.pano
	  	fill_in 'Cbp', with: @default.cbp
	  	select('Bar2', :from => 'business_category_id') 
	  	click_button 'Submit'
	  }.to change(Business, :count).by(1)
	  expect(current_path).to eq business_path((@default.id + 1))
	  expect(page).to have_content "Business was successfully created"
	  within 'h1' do
	  	expect(page).to have_content 'Default Cafe'
	  end
	end

	scenario "edit a business" do
		visit edit_business_path(@default)
		expect{
		  fill_in 'Name', with: 'Yum Bar'
		  click_button 'Submit'
		}.to_not change(Business, :count)
		expect(current_path).to eq business_path(@default.id)
		expect(page).to have_content "Business was successfully updated."
		within 'h1' do
			expect(page).to have_content 'Yum Bar'
		end
		within 'p' do
			expect(page).to have_content '1 Default Drive'
		end
	end

	scenario "delete a business" do
		visit edit_business_path(@default)
		expect{
			click_link 'Delete'
		}.to change(Business, :count).by(-1)
		expect(current_path).to eq  businesses_path
		expect(page).to have_content "Business was successfully deleted"
		expect(page).to have_content "Index"
	end
end

feature 'User Interaction' do
	before :each do
		@default = create(:default)
	end

	scenario "click link of a business in index" do
		visit businesses_path
		click_link 'Default Cafe'
		expect(page).to have_content "Default Cafe"
	end
end