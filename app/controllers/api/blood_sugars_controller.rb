module API
  class BloodSugarsController < ApplicationController
    def index
      @blood_sugars = BloodSugar.all
      render json: @blood_sugars
    end

    def show
      @blood_sugar = BloodSugar.find(params[:id])
      render json: @blood_sugar
    end
  end
end
