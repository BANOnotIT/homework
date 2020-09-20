# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/assertions'
require_relative 'logic'

class TestPart2 < Minitest::Test
  def gen_word(hissing = false)
    word = (('а'..'я').to_a.sample rand(1..6)).join ''
    word += (hissing ? 'щчшж' : 'крфнкстх').chars.sample
    word + 'онок'
  end

  def test_no_hissing
    (0..20).map do
      assert (transform_word gen_word).end_with? 'ята'
    end
  end

  def test_hissing
    (0..20).map do
      assert (transform_word gen_word(true)).end_with? 'ата'
    end
  end
end
