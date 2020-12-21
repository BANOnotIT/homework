# frozen_string_literal: true

require 'test_helper'

class TimeEntriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @time_entry = time_entries(:one)
    sign_in users(:asdf)
  end

  test 'should get index' do
    get time_entries_url
    assert_response :success
  end

  test 'should create time_entry' do
    assert_difference('TimeEntry.count') do
      post time_entries_url, params: { time_entry: { end: @time_entry.end, start: @time_entry.start, title: @time_entry.title, user_id: @time_entry.user_id } }
    end

    assert_redirected_to time_entries_url
  end

  test 'should show time_entry' do
    get time_entry_url(@time_entry)
    assert_response :success
  end

  test 'should get edit' do
    get edit_time_entry_url(@time_entry)
    assert_response :success
  end

  test 'should update time_entry' do
    patch time_entry_url(@time_entry), params: { time_entry: { end: @time_entry.end, start: @time_entry.start, title: @time_entry.title, user_id: @time_entry.user_id } }
    assert_redirected_to time_entries_url
  end

  test 'should destroy time_entry' do
    assert_difference('TimeEntry.count', -1) do
      delete time_entry_url(@time_entry)
    end

    assert_redirected_to time_entries_url
  end

  test 'should give current time entry' do
    get active_time_entry_path, params: { format: :json }
    assert_response :success

    body = JSON.parse(response.body)
    assert_equal body['id'], time_entries(:continuing).id
  end
end
