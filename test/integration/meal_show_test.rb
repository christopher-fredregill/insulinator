require_relative '../test_helper'

class MealShowTest < ActionDispatch::IntegrationTest

  setup { host! 'api.example.com' }

  test 'Meal show' do
    breakfast = Meal.create!(name: 'breakfast', description: 'test breakfast')

    get "/meals/#{breakfast.id}"
    assert_equal 200, response.status

    meal = json(response.body)
    assert_equal meal[:name], 'breakfast'
    assert_equal meal[:description], 'test breakfast'
  end
end
