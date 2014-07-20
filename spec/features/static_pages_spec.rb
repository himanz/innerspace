require 'spec_helper'

feature 'Static Pages link click' do
	scenario "click about in nav bar" do
		visit root_path
		click_link 'About'
		expect(current_path).to eq about_path
		expect(page).to have_content 'About'
	end
end