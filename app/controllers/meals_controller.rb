class MealsController < ApplicationController

	attr_accessor :name, :description, :eaten_at

  def index
  	@meals = Meal.all
	end

	def show
		@meal = Meal.find(params[:id])
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
		params.require(:meal).permit(:name, :description, :eaten_at)
	end
end
