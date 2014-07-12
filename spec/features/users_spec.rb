require 'spec_helper'

feature 'User management' do
  before :each do
  	@default = create(:default_user)
  end

	scenario "user signup" do
		visit root_path
		click_link 'Sign up'
		expect {
			fill_in 'user_email', with: "joe@joe.com"
			fill_in 'user_password', with: "12345678"
			fill_in 'user_password_confirmation', with: "12345678"
			click_button 'Sign up'
		}.to change(User, :count).by(1)
	end
  
  scenario "user login" do
  	visit root_path
  	click_link "Login"
  	fill_in 'user_email', with: @default.email
  	fill_in 'user_password', with: @default.password
  	click_button 'Sign in'
  	expect(page).to have_content "Signed in successfully."
  end

  scenario "user logout" do
  	visit root_path
  	click_link "Login"
  	fill_in 'user_email', with: @default.email
  	fill_in 'user_password', with: @default.password
  	click_button 'Sign in'
  	click_link "Logout"
  	expect(page).to have_content "Signed out successfully."
  end
	scenario "edit a user"
	
end