class IngredientsController < ApplicationController

	before_filter: :get_meal

	def get_meal
		@meal = Meal.find(params[:meal_id])	
	end

	def show
		@ingredient = @meal.ingredients.find(params[:id])
	end

  def index
		@ingredients = @meal.ingredients
  end

  def create
  	@ingredient = Ingredient.new(params[:ingredient])
		if request.post?
			@ingredient.save
			redirect_to action: 'index'
		end
	end

	private
	
	def ingredient_params
		params.require(:name, :amount).permit(:name, :amount)	
	end
end
