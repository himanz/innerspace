require 'spec_helper'

describe BusinessesController do
	shared_examples("public access to businesses") do
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

			context 'with params[:category]' do
				it "populates an array of businesses with the same category" do
					hotel1 = create(:hotel1_business)
					hotel2 = create(:hotel2_business)
					park = create(:park_business)
					get :index, category: "1"
					expect(assigns(:businesses)).to match_array([hotel1, hotel2])
				end

				it "renders the :index view" do
					get :index, category: "1"
					expect(response).to render_template :index
				end
			end

			context 'without params' do
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
			it "redirects to businesses index due to not admin" do
				get :new
				expect(response).to redirect_to businesses_url
			end
		end
	  
	  describe 'GET #edit' do
	  	it "requires admin status for user" do
	  		business = create(:business)
	  		get :edit, id: business
	  		expect(response).to redirect_to businesses_url
	  	end
	  end

		describe "POST #create" do
			it "does not save the new business in the database" do
				expect{
					post :create, business: attributes_for(:business)
				}.to change(Business, :count).by(0)
			end

			it "redirects to businesses index due to not admin" do
				post :create, business: attributes_for(:business)
				expect(response).to redirect_to businesses_url
		  end
		end

		describe 'PATCH #update' do
			before :each do
				@business = create(:business, name: "Star Walk", address: "12 Star Walk Drive")
			end
	
			it "located the requested @business" do
				patch :update, id: @business, business: attributes_for(:business)
				expect(assigns(:business)).to eq(@business)
			end

			it "does not change @business' attributes" do
				patch :update, id: @business, business: attributes_for(:business, name: "Moon Walk", address: "12 Star Walk Drive")
				@business.reload
				expect(@business.name).to eq("Star Walk")
				expect(@business.address).to eq("12 Star Walk Drive")
			end

			it "redirects to businesses index due to not admin" do
				patch :update, id: @business, business: attributes_for(:business)
				expect(response).to redirect_to businesses_url
			end		
		end

		describe 'DELETE #destroy' do
			before :each do
				@business = create(:business)
			end

			it "does not deletes the business" do
				expect{ delete :destroy, id: @business}.to_not change(Business, :count)
			end
			
			it "redirects to businesses index due to not admin" do
				delete :destroy, id: @business
				expect(response).to redirect_to businesses_url
			end
		end
	end

	describe "administrator access" do
    before :each do
    	user = create(:admin_user)
    	sign_in user
    end

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

			context 'with params[:category]' do
				it "populates an array of businesses with the same category" do
					hotel1 = create(:hotel1_business)
					hotel2 = create(:hotel2_business)
					park = create(:park_business)
					get :index, category: "1"
					expect(assigns(:businesses)).to match_array([hotel1, hotel2])
				end

				it "renders the :index view" do
					get :index, category: "1"
					expect(response).to render_template :index
				end
			end

			context 'without params' do
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
	  
	  describe 'GET #edit' do
	  	it "assigns the requested business to @business" do
	  		business = create(:business)
	  		get :edit, id: business
	  		expect(assigns(:business)).to eq business
	  	end

	  	it "renders the :edit template" do
	  		business = create(:business)
	  		get :edit, id: business
	  		expect(response).to render_template :edit
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
				it "does not save the new business in the database" do
					expect{
						post :create, business: attributes_for(:invalid_business)
					}.to_not change(Business, :count)
				end

				it "re-renders the :new template" do
					post :create, business: attributes_for(:invalid_business)
					expect(response).to render_template :new
				end
			end
		end

		describe 'PATCH #update' do
			before :each do
				@business = create(:business, name: "Star Walk", address: "12 Star Walk Drive")
			end

			context "valid attributes" do
				it "located the requested @business" do
					patch :update, id: @business, business: attributes_for(:business)
					expect(assigns(:business)).to eq(@business)
				end

				it "changes @business' attributes" do
					patch :update, id: @business, business: attributes_for(:business, name: "Moon Walk", address: "12 Star Walk Drive")
					@business.reload
					expect(@business.name).to eq("Moon Walk")
					expect(@business.address).to eq("12 Star Walk Drive")
				end

				it "redirects to the updated business" do
					patch :update, id: @business, business: attributes_for(:business)
					expect(response).to redirect_to @business
				end
			end

			context "with invalid attributes" do
				it "does not change the business' attributes" do
					patch :update, id: @business, business: attributes_for(:business, name: "Moon Walk", address: nil)
					@business.reload
					expect(@business.name).to_not eq("Moon Walk")
					expect(@business.address).to eq("12 Star Walk Drive")
				end

				it "re-renders the edit template" do
					patch :update, id: @business, business: attributes_for(:invalid_business)
					expect(response).to render_template :edit
				end
			end
		end

		describe 'DELETE #destroy' do
			before :each do
				@business = create(:business)
			end

			it "deletes the business" do
				expect{ delete :destroy, id: @business}.to change(Business, :count).by(-1)
			end
			
			it "redirects to business#index" do
				delete :destroy, id: @business
				expect(response).to redirect_to businesses_url
			end
		end
	end

	describe "user access" do
		before :each do
    	user = create(:user)
    	sign_in user
    end

    it_behaves_like "public access to businesses"
  end

		

	describe "guest access" do
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

			context 'with params[:category]' do
				it "populates an array of businesses with the same category" do
					hotel1 = create(:hotel1_business)
					hotel2 = create(:hotel2_business)
					park = create(:park_business)
					get :index, category: "1"
					expect(assigns(:businesses)).to match_array([hotel1, hotel2])
				end

				it "renders the :index view" do
					get :index, category: "1"
					expect(response).to render_template :index
				end
			end

			context 'without params' do
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
			it "redirects to businesses index due to not admin" do
				get :new
				expect(response).to redirect_to businesses_url
			end
		end
	  
	  describe 'GET #edit' do
	  	it "requires admin status for user" do
	  		business = create(:business)
	  		get :edit, id: business
	  		expect(response).to redirect_to businesses_url
	  	end
	  end

		describe "POST #create" do
			it "does not save the new business in the database" do
				expect{
					post :create, business: attributes_for(:business)
				}.to change(Business, :count).by(0)
			end

			it "redirects to businesses index due to not admin" do
				post :create, business: attributes_for(:business)
				expect(response).to redirect_to businesses_url
		  end
		end

		describe 'PATCH #update' do
			before :each do
				@business = create(:business, name: "Star Walk", address: "12 Star Walk Drive")
			end
	
			it "located the requested @business" do
				patch :update, id: @business, business: attributes_for(:business)
				expect(assigns(:business)).to eq(@business)
			end

			it "does not change @business' attributes" do
				patch :update, id: @business, business: attributes_for(:business, name: "Moon Walk", address: "12 Star Walk Drive")
				@business.reload
				expect(@business.name).to eq("Star Walk")
				expect(@business.address).to eq("12 Star Walk Drive")
			end

			it "redirects to businesses index due to not admin" do
				patch :update, id: @business, business: attributes_for(:business)
				expect(response).to redirect_to businesses_url
			end		
		end

		describe 'DELETE #destroy' do
			before :each do
				@business = create(:business)
			end

			it "does not deletes the business" do
				expect{ delete :destroy, id: @business}.to_not change(Business, :count)
			end
			
			it "redirects to businesses index due to not admin" do
				delete :destroy, id: @business
				expect(response).to redirect_to businesses_url
			end
		end
	end
end
