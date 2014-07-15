require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature 'Business management' do
	describe "admin access" do
		before :each do
			user = create(:admin_user)
			login_as(user)
			@default = create(:default)
			create(:default_category)
		end

		scenario "add a new business" do		  
		  visit new_business_path
		  expect {
		  	fill_in 'Name', with: @default.name
		  	fill_in 'Address', with: @default.address
		  	fill_in 'Heading', with: @default.heading
		  	fill_in 'Pano', with: @default.pano
		  	fill_in 'Cbp', with: @default.cbp
		  	fill_in 'Latitude', with: @default.latitude
		  	fill_in 'Longitude', with: @default.longitude
		  	select("Hotel", :from => 'business_category_id')
		  	click_button 'Submit'
		  }.to change(Business, :count).by(1)
		  expect(current_path).to eq business_path((@default.id + 1))
		  expect(page).to have_content "Business was successfully created"
		  expect(page).to have_content 'Default Cafe'
		end

		scenario "edit a business" do
			visit edit_business_path(@default)
			expect{
			  fill_in 'Name', with: 'Yum Bar'
			  select('Hotel', :from => 'business_category_id')
			  click_button 'Submit'
			}.to_not change(Business, :count)
			expect(current_path).to eq business_path(@default)
			expect(page).to have_content "Business was successfully updated."
			expect(page).to have_content 'Yum Bar'
			expect(page).to have_content '1 Default Drive'
			
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

  describe "user access" do
		before :each do
			user = create(:user)
			login_as(user)
			@default = create(:default)
			create(:default_category)
		end

		scenario "add a new business" do		  
		  visit new_business_path
		  expect(current_path).to eq businesses_path
		  expect(page).to have_content "You need admin status to access the previous page."
		end

		scenario "edit a business" do
			visit edit_business_path(@default)
			expect(current_path).to eq businesses_path
			expect(page).to have_content "You need admin status to access the previous page."
		end

		scenario "delete a business" do
			visit edit_business_path(@default)
			expect(current_path).to eq  businesses_path
			expect(page).to have_content "You need admin status to access the previous page."
		end
  end

  describe "guest access" do
  	before :each do
			@default = create(:default)
			create(:default_category)
		end

		scenario "add a new business" do		  
		  visit new_business_path
		  expect(current_path).to eq businesses_path
		  expect(page).to have_content "You need admin status to access the previous page."
		end

		scenario "edit a business" do
			visit edit_business_path(@default)
			expect(current_path).to eq businesses_path
			expect(page).to have_content "You need admin status to access the previous page."
		end

		scenario "delete a business" do
			visit edit_business_path(@default)
			expect(current_path).to eq  businesses_path
			expect(page).to have_content "You need admin status to access the previous page."
		end
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

  # Work on this to make the correct test pass.  After submit
  # button click, no results are displayed
	scenario "select hotel option to sort index by hotel" do
		create(:default_category)
		create(:category, name: "Park")
		create(:hotel1_business)
		create(:hotel2_business)
		create(:park_business)

		visit businesses_path
		expect(page).to have_content "Holiday"
		select("Hotel", :from => 'category')
		click_button 'Submit'
		expect(current_path).to eq businesses_path
		# expect(page).to have_content "Holiday"
		# expect(page).to have_content "Ramada"
		# expect(page).to_not have_content "Cherry"
	end
end