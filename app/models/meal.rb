class Meal < ActiveRecord::Base
	has_many :ingredients
	has_many :insulins
end
