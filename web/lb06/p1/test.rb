require 'minitest/autorun'
require 'minitest/assertions'
require_relative 'logic'

class TestSinLoop < Minitest::Test
  def test_3_thousandth
    assert_in_delta compute(10 ** -3)[0], Math.sin(3), 10 ** -3
  end

  def test_4_thousandth
    assert_in_delta compute(10 ** -4)[0], Math.sin(3), 10 ** -4
  end
end


class TestSinEnumerator < Minitest::Test
  def test_3_thousandth
    assert_in_delta compute_with_enum(10 ** -3)[0], Math.sin(3), 10 ** -3
  end

  def test_4_thousandth
    assert_in_delta compute_with_enum(10 ** -4)[0], Math.sin(3), 10 ** -4
  end
end
