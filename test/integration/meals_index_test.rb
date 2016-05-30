require_relative '../test_helper'

class MealsIndexTest < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com' }

  test 'returns Meals without filters' do
    breakfast = Meal.create!(name: 'breakfast', description: 'test breakfast')
    lunch = Meal.create!(name: 'lunch', description: 'test lunch')

    get '/meals'
    assert_equal 200, response.status
    meal_names = json(response.body).collect { |m| m[:name] }
    assert_includes meal_names, breakfast.name
    assert_includes meal_names, lunch.name
  end
end
