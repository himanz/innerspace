require 'spec_helper'

describe StaticPagesController do
  describe "GET #about_me" do
  	it "renders the about_me template" do
  		get :about_me
  		expect(response).to render_template :about_me
  	end
  end
end
