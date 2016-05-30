module API
  class IngredientsController < ApplicationController
    def index
      @ingredients = Meal.find(params[:meal_id]).ingredients
      render json: @ingredients
    end

    def show
      @ingredient = Meal.find(params[:meal_id]).ingredients.find(params[:id])
      render json: @ingredient
    end
  end
end
