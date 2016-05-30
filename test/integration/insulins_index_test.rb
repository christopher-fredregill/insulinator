require_relative '../test_helper'

class InsulinsIndexTest < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com' }
  
  test 'Insulins index without filters' do
    injected_at = Time.now
    humalog = Insulin.create!(name: 'Humalog', description: 'post-meal correction', amount: 0.5, injected_at: injected_at)

    get '/insulins/'
    assert_equal 200, response.status

    insulins = json(response.body).collect { |i| i[:description] }
    assert_includes insulins, 'post-meal correction'
  end
end
