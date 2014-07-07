require 'spec_helper'

describe BusinessesController do
	describe 'GET #index' do
		context 'with params[:letter]' do
			it "populates an array of businesses starting with the letter"
			it "renders the :index view"
		end

		context 'without params[:letter]' do
			it "populates an array of all businesses"
			it "renders the :index view"
		end
	end

end
