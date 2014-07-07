require 'spec_helper'

describe BusinessesController do
	describe 'GET #index' do
		context 'with params[:letter]' do
			it "populates an array of businesses starting with the letter" do
				pho = create(:business, name: 'Pho')
				bob = create(:business, name: 'Bob')
				get :index, letter: 'P'
				expect(assigns(:businesses)).to match_array([pho])
			end

			it "renders the :index view" do
				get :index, letter: 'P'
				expect(response).to render_template :index
			end
		end

		context 'without params[:letter]' do
			it "populates an array of all businesses"
			it "renders the :index view"
		end
	end

end
