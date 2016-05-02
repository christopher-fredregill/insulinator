class MealsController < ApplicationController

  def index
  	@meals = Meal.all
	end

	def show
		@meal = Meal.find(params[:id])
		@new_ingredient = @meal.ingredients.build
	end

	def new
		@meal = Meal.new
	end

	def create
		if request.post?
			@meal = Meal.new meal_params
			@meal.save
			redirect_to @meal
		end
	end

	private

	def meal_params
		params.require(:meal).permit(:eaten_at)
	end
end
