# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/assertions'
require_relative 'logic'

class TestLambdaSyntax < Minitest::Test
  def test_true
    assert neibr(0, 1, ->(_) { 1 })
    assert neibr(1.0 / 0, 2, ->(_) { 2 })
  end

  def test_false
    refute neibr(0, 0, ->(_) { 1 })
    refute neibr(1.0 / 0, 0, ->(_) { 2 })
  end
end

class TestBlockSyntax < Minitest::Test
  def test_true
    assert neibr_block(0, 1) { |_| 1 }
    assert neibr_block(1.0 / 0, 2) { |_| 2 }
  end

  def test_false
    refute neibr_block(0, 0) { |_| 1 }
    refute neibr_block(1.0 / 0, 0) { |_| 2 }
  end
end
