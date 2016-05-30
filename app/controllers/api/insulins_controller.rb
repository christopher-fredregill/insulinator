module API
  class InsulinsController < ApplicationController
    def index
      if meal_id = params[:meal_id]
        @insulins = Meal.find(meal_id).insulins
      else
        @insulins = Insulin.all
      end
      render json: @insulins
    end

    def show
      if meal_id = params[:meal_id]
        @insulin = Meal.find(meal_id).insulins.find(params[:id])
      else
        @insulin = Insulin.find(params[:id])
      end
      render json: @insulin
    end
  end
end
