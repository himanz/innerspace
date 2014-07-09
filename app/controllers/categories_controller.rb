class CategoriesController < ApplicationController
	before_action :set_category, only: [:show, :edit, :update, :destroy]

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
			if @category.save
				format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @category }
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
  		if @category.update(category_params)
  			format.html { redirect_to @category, notice: "Category was successfully updated" }
        format.json { head :no_content }
      else
      	format.html { render action: 'edit' }
      	format.json { render json: @category.errors, status: :unprocessable_entity }
  		end
  	end
  end

  def destroy
  	@category.destroy
  	respond_to do |format|
  		format.html { redirect_to categories_url, notice: "Category was successfully deleted" }
  		format.json { head :no_content }
  	end
  end

	private

	def set_category
		@category = Category.find(params[:id])
	end

	def category_params
		params.require(:category).permit(:name)
	end
end
