# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/assertions'
require_relative 'logic'

class TestPart1 < Minitest::Test
  def test_first_arg
    assert_in_delta (1 + 2 * Math::E) * Math.cos(-5), y_from(1, 0)
    assert_in_delta (4 + 2 * Math::E ** 2) * Math.cos(-5), y_from(2, 0)
  end

  def test_second_arg
    assert_in_delta (1 + 2 * Math::E) * Math.cos(6 - 5), y_from(1, 1)
    assert_in_delta (1 + 2 * Math::E) * Math.cos(12 - 5), y_from(1, 2)
  end
end
