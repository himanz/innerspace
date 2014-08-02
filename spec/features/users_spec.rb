require 'spec_helper'

OmniAuth.config.test_mode = true

feature 'User management' do
  before :each do
  	@default = create(:default_user)
  end

	scenario "user signup" do
		visit root_path
		click_link 'Sign up'
		expect {
			fill_in 'user_email', with: "joe@joe.com"
      fill_in 'user_first_name', with: "Joe"
      fill_in 'user_last_name', with: "Star"
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

  scenario "sign in with facebook"
    
    # visit root_path
    # click_link "Sign in with Facebook"
    # OmniAuth.config.mock_auth[:facebook] = {
    #     provider: 'facebook',
    #     uid: user.uid,
    #     credentials: {
    #         token: 'facebook token'
    #     }
    # }
    # expect(page).to have_content "Successfully authenticated from Facebook account."
  

  scenario "user logout" do
  	visit root_path
  	click_link "Login"
  	fill_in 'user_email', with: @default.email
  	fill_in 'user_password', with: @default.password
  	click_button 'Sign in'
  	click_link "Logout"
  	expect(page).to have_content "Signed out successfully."
  end

	scenario "edit a user" do
		visit root_path
  	click_link "Login"
  	fill_in 'user_email', with: @default.email
  	fill_in 'user_password', with: @default.password
  	click_button 'Sign in'
		click_link "Edit profile"
		fill_in 'user_first_name', with: "Bobby"
		fill_in 'user_current_password', with: @default.password
		click_button "Update"
		expect(page).to have_content "Bobby"
	end
	
end