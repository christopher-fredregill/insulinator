require_relative '../test_helper'

class BloodSugarsIndexTest < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com' }

  test 'BloodSugars index without filters' do
    measured_at = Time.now
    fasting_glucose = BloodSugar.create!(reading: 83, measured_at: measured_at)
    post_breakfast_glucose = BloodSugar.create!(reading: 94, measured_at: measured_at.advance(hours: 3))

    get '/blood_sugars/'
    assert_equal 200, response.status

    readings = json(response.body).collect { |bs| bs[:reading] }
    assert_includes readings, '83.0'
    assert_includes readings, '94.0'
  end
end
