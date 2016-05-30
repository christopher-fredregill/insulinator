require_relative '../test_helper'

class InsulinShowTest < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com' }

  test 'Insulin show' do
    injected_at = Time.now
    humalog = Insulin.create!(name: 'Humalog', description: 'post-meal correction', amount: 0.5, injected_at: injected_at)

    get "/insulins/#{humalog.id}"
    assert_equal 200, response.status

    insulin = json(response.body)
    assert_equal insulin[:name], 'Humalog'
    assert_equal insulin[:description], 'post-meal correction'
    assert_equal insulin[:amount], '0.5'
  end
end
