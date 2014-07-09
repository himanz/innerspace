require 'spec_helper'

describe CategoriesController do
  describe 'GET #index' do
    it "populates an array of categories in alphabetical order" do
    	hotel = create(:category, name: 'Hotel')
    	bar = create(:category, name: 'Bar')
    	get :index
    	expect(assigns(:categories)).to match_array([bar, hotel])
    end

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
    	it "does not change the category's attributes"
    	it "re-renders the edit template"
    end
  end
end
