class BusinessesController < ApplicationController
  before_action :set_business, only: [:show]

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
	end

	private

	def set_business
		@business = Business.find(params[:id])
	end
	# def business_params
	# 	params.require(:business).permit(:name, :address)
	# end
end
