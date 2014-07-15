require 'spec_helper'

describe CategoriesController do
  shared_examples("public access to categories") do
    describe 'GET #index' do
      it "redirects to businesses index due to not admin" do
        get :index
        expect(response).to redirect_to businesses_url
      end
    end

    describe 'GET #show' do
      it "assigns the requested category to @category" do
        category = create(:category)
        get :show, id: category
        expect(assigns(:category)).to eq category
      end

      it "renders the :show template" do
        category = create(:category)
        get :show, id: category
        expect(response).to redirect_to businesses_url
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
        category = create(:category)
        get :edit, id: category
        expect(response).to redirect_to businesses_url
      end
    end

    describe "POST #create" do
      context "with valid attributes" do
        it "saves the new category in the database" do
          expect{
            post :create, category: attributes_for(:category)
          }.to change(Category, :count).by(0)
        end

        it "redirects to businesses index due to not admin" do
          post :create, category: attributes_for(:category)
          expect(response).to redirect_to businesses_url
        end
      end
    end

    describe 'PATCH #update' do
      before :each do
        @category = create(:category, name: "Park")
      end
 
      it "located the requested @category" do
        patch :update, id: @category, category: attributes_for(:category)
        expect(assigns(:category)).to eq(@category)
      end

      it "does not change @category's attributes" do
        patch :update, id: @category, category: attributes_for(:category, name: "University")
        @category.reload
        expect(@category.name).to eq("Park")
      end

      it "redirects to businesses index due to not admin" do
        patch :update, id: @category, category: attributes_for(:category)
        expect(response).to redirect_to businesses_url
      end
    end

    describe 'DELETE #destroy' do
      before :each do
        @category = create(:category)
      end

      it "deletes the category" do
        expect{delete :destroy, id: @category}.to_not change(Category, :count)
      end

      it "redirects to businesses index due to not admin" do
        delete :destroy, id: @category
        expect(response).to redirect_to businesses_url
      end
    end
  end

  shared_examples("full access to categories") do
    describe 'GET #index' do
      it "renders the :index view" do
      	get :index
      	expect(response).to render_template :index
      end
    end

    describe 'GET #show' do
    	it "assigns the requested category to @category" do
    		category = create(:category)
    		get :show, id: category
    		expect(assigns(:category)).to eq category
    	end

    	it "renders the :show template" do
    		category = create(:category)
    		get :show, id: category
    		expect(response).to render_template :show
    	end
    end

    describe 'GET #new' do
    	it "assigns a new category to @category" do
    		get :new
    		expect(assigns(:category)).to be_a_new(Category)
    	end

    	it "renders the :new template" do
    		get :new
    		expect(response).to render_template :new
    	end
    end

    describe 'GET #edit' do
    	it "assigns the requested category to @category" do
    		category = create(:category)
    		get :edit, id: category
    		expect(assigns(:category)).to eq category
    	end

    	it "renders the :edit template" do
    		category = create(:category)
    		get :edit, id: category
    		expect(response).to render_template :edit
    	end
    end

    describe "POST #create" do
    	context "with valid attributes" do
    		it "saves the new category in the database" do
    			expect{
    				post :create, category: attributes_for(:category)
    			}.to change(Category, :count).by(1)
    		end

    		it "redirects to category #show" do
    			post :create, category: attributes_for(:category)
    			expect(response).to redirect_to category_path(assigns(:category))
    		end
    	end

    	context "with invalid attributes" do
    		it "does not save the new category in the database" do
    			expect{
    				post :create, category: attributes_for(:invalid_category)
    			}.to_not change(Category, :count)
    		end

    		it "re-renders the :new template" do
    			post :create, category: attributes_for(:invalid_category)
    			expect(response).to render_template :new
    		end
    	end
    end

    describe 'PATCH #update' do
    	before :each do
    		@category = create(:category, name: "Park")
    	end

    	context "valid attributes" do
    		it "located the requested @category" do
    			patch :update, id: @category, category: attributes_for(:category)
    			expect(assigns(:category)).to eq(@category)
    		end

    		it "changes @category's attributes" do
    			patch :update, id: @category, category: attributes_for(:category, name: "University")
    			@category.reload
    			expect(@category.name).to eq("University")
    		end

    		it "redirects to the updated category" do
    			patch :update, id: @category, category: attributes_for(:category)
    			expect(response).to redirect_to @category
    		end
    	end

      context "with invalid attributes" do
      	it "does not change the category's attributes" do
      		patch :update, id: @category, category: attributes_for(:category, name: nil)
      		@category.reload
      		expect(@category.name).to eq("Park")
      	end

      	it "re-renders the edit template" do
      		patch :update, id: @category, category: attributes_for(:invalid_category)
      		expect(response).to render_template :edit
      	end
      end
    end

    describe 'DELETE #destroy' do
    	before :each do
    		@category = create(:category)
    	end

    	it "deletes the category" do
    		expect{delete :destroy, id: @category}.to change(Category, :count).by(-1)
    	end

    	it "redirects to category#index" do
    		delete :destroy, id: @category
    		expect(response).to redirect_to categories_url
    	end
    end
  end

  describe "admin access" do
    before :each do
      user = create(:admin_user)
      sign_in user
    end

    it_behaves_like "full access to categories"
  end

  describe "user access" do
    before :each do
      user = create(:user)
      sign_in user
    end

    it_behaves_like "public access to categories"
  end

  describe "guest access" do
    it_behaves_like "public access to categories"
  end
end
