require 'spec_helper'

feature 'Static Pages link click' do
	scenario "click about in footer" do
		visit root_path
		click_link 'About'
		expect(current_path).to eq about_path
		expect(page).to have_content 'About'
	end

	scenario "click contact in footer" do
		visit businesses_path
		click_link 'Contact'
		expect(current_path).to eq contact_us_path
		expect(page).to have_content "Contact Me"
	end
end