# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/assertions'
require_relative 'logic'

class FileGeneration < Minitest::Test
  def setup
    super
    File.delete('F.test') if File.exist? 'F.test'
  end

  alias teardown setup

  def test_file_creation
    generate_file_with_numbers 'F.test'
    assert File.exist? 'F.test'
  end

  def test_file_lines
    generate_file_with_numbers 'F.test', 20
    assert_equal 21, File.open('F.test', 'r', &:count)
  end

  def test_max_number
    generate_file_with_numbers 'F.test', 1000, 23
    assert File.open('F.test', 'r') { |f| f.map(&:to_i).max } < 23
  end
end

class FileTransformation < Minitest::Test
  def setup
    super

    generate_file_with_numbers 'F.test', 20
    @source_numbers = File.open('F.test', 'r') { |f| f.map(&:to_i) }

    unique_numbers_from_file_into_file 'F.test', 'G.test'
    @result_numbers = File.open('G.test', 'r') { |f| f.map(&:to_i) }

    File.delete('F.test')
    File.delete('G.test')
  end

  def test_result_is_not_empty
    refute_empty @result_numbers
  end

  def test_no_new_numbers
    assert @result_numbers.to_set.subset?(@source_numbers.to_set)
  end

  def test_result_numbers_are_uniq
    assert_equal @result_numbers.count, @result_numbers.uniq.count
  end
end
