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
			it "populates an array of all businesses" do
				pho = create(:business, name: 'Pho')
				bob = create(:business, name: 'Bob')
				get :index
				expect(assigns(:businesses)).to match_array([bob, pho]) 
			end

			it "renders the :index view" do
				get :index
				expect(response).to render_template :index
			end
		end
	end

	describe 'GET #show' do
		it "assigns the requested business to @business" do
			business = create(:business)
			get :show, id: business
			expect(assigns(:business)).to eq business
		end

		it "renders the :show template" do
			business = create(:business)
			get :show, id: business
			expect(response).to render_template :show
		end
	end

	describe 'GET #new' do
		it "assigns a new Business to @business" do
			get :new
			expect(assigns(:business)).to be_a_new(Business)
		end

		it "renders the :new template" do
			get :new
			expect(response).to render_template :new
		end
	end

	describe "POST #create" do
		context "with valid attributes" do
			it "saves the new business in the database" do
				expect{
					post :create, business: attributes_for(:business)
				}.to change(Business, :count).by(1)
			end

			it "redirects to business#show" do
				post :create, business: attributes_for(:business)
				expect(response).to redirect_to business_path(assigns(:business))
			end
		end

		context "with invalid attributes" do
			it "does not save the new business in the database"
			it "re-rendres the :new template"
		end
	end

end
