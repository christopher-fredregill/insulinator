require_relative '../test_helper'

class MealIngredientShowTest < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com' }

  test 'MealIngredient show' do
    breakfast = Meal.create!(name: 'breakfast', description: 'test breakfast')
    breakfast_eggs = breakfast.ingredients.create!(name: 'egg', amount: 2)

    get "/meals/#{breakfast.id}/ingredients/#{breakfast_eggs.id}"
    assert_equal 200, response.status
    ingredient = json(response.body)
    assert_equal ingredient[:name], 'egg'
    assert_equal ingredient[:amount], '2.0'
  end
end
