class InsulinController < ApplicationController
  def index
  	@insulins = Insulin.all
	end

	def show
		@insulin = Insulin.find(params[:id])
	end

  def new
 		@insulin = Insulin.new(params[:insulin])
		if request.post?
			@insulin.save
			redirect_to action: 'index'
		end 
	end
end
