require_relative '../test_helper'

class BloodSugarShowTest < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com' }
  
  test 'BloodSugar show' do
    measured_at = Time.now.utc
    fasting_glucose = BloodSugar.create!(reading: 83, units: 'mg/dL', measured_at: measured_at)
    
    get "/blood_sugars/#{fasting_glucose.id}"
    assert_equal 200, response.status

    glucose = json(response.body)
    assert_equal glucose[:reading], '83.0'
    assert_equal glucose[:units], 'mg/dL'
    assert_equal Time.parse(glucose[:measured_at]).to_s, measured_at.utc.to_s
  end
end
