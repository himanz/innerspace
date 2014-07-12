require 'spec_helper'

feature 'User management' do
  before :each do
  	@default = create(:default_user)
  end

	scenario "user signup" do
		visit root_path
		expect {
			click_link 'Sign up'
			fill_in 'user_email', with: @default.email
			fill_in 'user_password', with: @default.password
			fill_in 'user_password_confirmation', with: @default.password
			click_button 'Sign up'
		}.to change(User, :count).by(1)
	end
	scenario "edit a user"
	scenario "user login"
	scenario "user logout"
end