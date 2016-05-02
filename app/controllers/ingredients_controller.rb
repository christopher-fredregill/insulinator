class IngredientsController < ApplicationController
  def index
		@ingredients = Ingredient.all
  end

	def show
		@ingredient = Ingredient.find(params[:id])
	end

  def new
  	@ingredient = Ingredient.new(params[:ingredient])
		if request.post?
			@ingredient.save
			redirect_to action: 'index'
		end
	end
end
