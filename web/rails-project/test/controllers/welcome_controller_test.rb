require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get welcome_index_url
    assert_response :success
  end

  test "should get result" do
    get welcome_result_url, params: {n: 5}
    assert_response :success

    assert_select 'td', '9' # last result
    assert_select 'td>strong', '4' # count
  end
end
