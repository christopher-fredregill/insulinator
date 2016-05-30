require_relative '../test_helper'

class MealInsulinShowTest < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com' }

  test 'MealInsulin show' do
    breakfast = Meal.create!(name: 'breakfast', description: 'test breakfast')
    injected_at = Time.now.utc
    breakfast_humalog = breakfast.insulins.create!(name: 'Humalog', description: 'carb bolus', amount: 0.5, injected_at: injected_at)
    
    get "/meals/#{breakfast.id}/insulins/#{breakfast_humalog.id}"
    assert_equal 200, response.status

    insulin = json(response.body)
    assert_equal insulin[:name], 'Humalog'
    assert_equal insulin[:description], 'carb bolus'
    assert_equal insulin[:amount], '0.5'
    assert_equal Time.parse(insulin[:injected_at]).to_s, injected_at.to_s
  end
end
