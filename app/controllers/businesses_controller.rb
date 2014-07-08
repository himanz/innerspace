class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit]

	def index
		if params[:letter]
			@businesses = Business.by_letter(params[:letter])
		else
			@businesses = Business.order("name")
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
        format.html { redirect_to @business, notice: 'Contact was successfully created.' }
        format.json { render action: 'show', status: :created, location: @business }
      else
        format.html { render action: 'new' }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
	end

	def edit
	end

	private

	def set_business
		@business = Business.find(params[:id])
	end
	
	def business_params
		params.require(:business).permit(:name, :address)
	end
end
