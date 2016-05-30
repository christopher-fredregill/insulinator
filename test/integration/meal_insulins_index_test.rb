require_relative '../test_helper'

class MealInsulinsIndexTest < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com' }
  
  test 'MealInsulins index without filters' do
    breakfast = Meal.create!(name: 'breakfast', description: 'test breakfast')
    lunch = Meal.create!(name: 'lunch', description: 'test lunch')
    breakfast_injected_at = Time.now
    lunch_injected_at = breakfast_injected_at.advance(hours: 4)
    breakfast_humalog = breakfast.insulins.create!(name: 'Humalog', description: 'carb bolus', amount: 0.5, injected_at: breakfast_injected_at)
    breakfast_humulin = breakfast.insulins.create!(name: 'Humulin R', description: 'protein bolus', amount: 2.0, injected_at: breakfast_injected_at.advance(minutes: 30))
    lunch_humalog = lunch.insulins.create!(name: 'Humalog', description: 'carb bolus', amount: 0.25, injected_at: lunch_injected_at)

    get "/meals/#{breakfast.id}/insulins/"
    assert_equal 200, response.status
    
    insulin_names = json(response.body).collect { |i| i[:name] }
    injection_times = json(response.body).collect { |i|  i[:injected_at] }
    assert_includes insulin_names, 'Humalog'
    assert_includes insulin_names, 'Humulin R'
    refute_includes injection_times, lunch_injected_at # Make sure this isn't just because of a Time formatting issue
  end
end
