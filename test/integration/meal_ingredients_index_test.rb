require_relative '../test_helper'

class MealIngredientsIndexTest < ActionDispatch::IntegrationTest
  
  setup { host! 'api.example.com' }

  test 'MealIngredients index without filters' do
    breakfast = Meal.create!(name: 'breakfast', description: 'test breakfast')
    lunch = Meal.create!(name: 'lunch', description: 'test lunch')
    breakfast_egg = breakfast.ingredients.create!(name: 'egg', amount: 2)
    breakfast_avocado = breakfast.ingredients.create!(name: 'avocado', amount: 120)
    lunch_macademias = lunch.ingredients.create!(name: 'macademia nuts', amount: 44)

    get "/meals/#{breakfast.id}/ingredients/"
    assert_equal 200, response.status

    ingredients = json(response.body).collect { |i| i[:name] }
    assert_includes ingredients, 'egg'
    assert_includes ingredients, 'avocado'
    refute_includes ingredients, 'macademia nuts'
  end
end
