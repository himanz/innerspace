require 'spec_helper'

feature 'Static Pages link click' do
	scenario "click about me in nav bar" do
		visit root_path
		click_link 'About Me'
		expect(current_path).to eq about_me_path
		expect(page).to have_content 'About Me'
	end
end