class MealController < ApplicationController
  def index
  	@meals = Meal.all
	end

	def show
		@meal = Meal.find(params[:id])
	end

  def new
  	@meal = Meal.new(params[:meal])
		if request.post?
			@meal.save
			redirect_to action: 'index'
		end
	end
end
