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
end
