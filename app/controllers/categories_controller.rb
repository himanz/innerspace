class CategoriesController < ApplicationController
	before_action :set_category, only: [:show, :edit]

	def index
		@categories = Category.order("name")
	end

	def show
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		respond_to do |format|
			if @categories.save
				format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @category }
			end
		end
  end

  def edit
  end

	private

	def set_category
		@category = Category.find(params[:id])
	end

	def category_params
		params.require(:category).permit(:name)
	end
end
