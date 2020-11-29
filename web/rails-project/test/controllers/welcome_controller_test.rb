# frozen_string_literal: true

require 'test_helper'
require 'json'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get welcome_index_url
    assert_response :success
  end

  test 'should get result' do
    get welcome_result_url, params: { n: 5 }
    assert_response :success

    assert_select 'td', '9' # last result
    assert_select 'td>strong', '4' # count
  end

  test 'should return json' do
    get welcome_result_url, params: { n: 5, format: 'json' }
    assert_response :success

    assert_includes @response.headers['Content-Type'], 'application/json'
  end

  test 'should return rss' do
    get welcome_result_url, params: { n: 5, format: 'rss' }
    assert_response :success

    assert_includes @response.headers['Content-Type'], 'application/rss'
  end

  test 'should cache result in db' do
    before = CachedResult.count
    get welcome_result_url, params: { n: 1000 }
    after = CachedResult.count

    assert_equal before + 1, after
  end

  test 'should respond with different results' do
    get welcome_result_url, params: { n: 5, format: 'json' }
    first = JSON.parse @response.body

    get welcome_result_url, params: { n: 0, format: 'json' }
    second = JSON.parse @response.body

    refute_equal first, second
  end
end
