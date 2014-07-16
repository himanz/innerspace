class BusinessesController < ApplicationController
	 
  before_action :set_business, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, except: [:index, :show, :recent, :random]

	def index
		@category = Category.all
		if params[:letter]
			@businesses = Business.by_letter(params[:letter])
		elsif params[:category]
			@businesses = Business.by_category(params[:category]).page(params[:page])
		else
			@businesses = Business.order("name").page(params[:page])
		end
	end

	def show
	end

	def new
		@business = Business.new
	end

	def create
		@business = Business.new(business_params)
		respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Business was successfully created.' }
        format.json { render action: 'show', status: :created, location: @business }
      else
        format.html { render action: 'new' }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
	end

	def edit
	end

	def update
		respond_to do |format|
			if @business.update(business_params)
				format.html { redirect_to @business, notice: 'Business was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @business.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@business.destroy
		respond_to do |format|
			format.html { redirect_to businesses_url, notice: 'Business was successfully deleted' }
			format.json { head :no_content }
		end
	end

	def recent
		@businesses = Business.by_recent.page(params[:page])
	end

	def random
		redirect_to business_path(Business.random_pick)
	end

	private

	def set_business
		@business = Business.find(params[:id])
	end
	
	def business_params
		params.require(:business).permit(:name, :address, :heading, :pano, :cbp, :category_id, :latitude, :longitude, :state, :country, :city)
	end
end
