# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/assertions'
require_relative 'logic'

class TestTriangular < Minitest::Test
  def setup
    @a = Point[0, 0]
    @b = Point[0, 1]
    @c = Point[1, 0]
  end

  def test_square
    a = Triangular.new @a, @b, @c
    assert_in_delta 0.5, a.square, 10 ** -7
  end

  def test_square_side
    a = Prism.new @a, @b, @c, 4
    assert_in_delta (2 + Math.sqrt(2)) * 4, a.square_perm, 10 ** -7
  end

  def test_prism_is_child_of_triangle
    assert_equal Prism.superclass, Triangular
  end
end
