class InsulinsController < ApplicationController

	before_filter: get_meal

	def get_meal
		@meal = Meal.find(params[:meal_id]) 
	end

	def show
		@insulin = @meal.insulins.find(params[:id])
	end

  def index
  	@insulins = @meal.insulins
	end

  def create
 		@insulin = Insulin.new(params[:insulin])
		if request.post?
			@insulin.save
			redirect_to action: 'index'
		end 
	end

	private

	def insulin_params
		params.require(:name, :amount, :injected_at).permit(:description)
	end
end
