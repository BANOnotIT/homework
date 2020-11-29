# frozen_string_literal: true

require 'test_helper'
require 'bencode'

class CachedResultTest < ActiveSupport::TestCase
  def gen(x)
    { x: x, xsqr: x ** 2 }
  end

  def before_setup
    super
    @results = (1..5).map { |x| gen x }
  end

  test 'should set and get values' do
    instance = CachedResult.new
    instance.values = @results
    assert_equal instance.values, @results
  end

  test 'should bencode values' do
    instance = CachedResult.new
    instance.values = @results
    assert_equal instance.result, @results.map(&:values).flatten.bencode
  end

  test 'should error on non unique N' do
    instance = CachedResult.new(n: 0)
    instance.values = [{ x: 0, xsqr: 0 }]
    instance.validate
    assert_equal instance.errors[:n], ['has already been taken']
  end

  test 'should get data from db' do
    assert_equal CachedResult.find_by(n: 0).values, [{ x: 0, xsqr: 0 }]
  end

  test 'should save data into db' do
    instance = CachedResult.new(n: 10)
    instance.values = [gen(0)]
    assert instance.save
  end
end
