class BusinessesController < ApplicationController
	def index
		if params[:letter]
			@businesses = Business.by_letter(params[:letter])
		else
			@businesses = Business.order("name")
		end
	end

	def show
	end

	# private
	# def business_params
	# 	params.require(:business).permit(:name, :address)
	# end
end
