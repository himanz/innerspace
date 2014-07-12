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

	scenario "edit a user"
	scenario "user login"
	scenario "user logout"
end