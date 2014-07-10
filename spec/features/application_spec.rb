require 'spec_helper'

feature 'Application API keys' do
	scenario 'Google Maps API key return true' do
		expect(ENV.key?("google_maps_api_key")).to be true
	end
end
