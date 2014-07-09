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
end
