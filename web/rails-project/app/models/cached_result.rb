# frozen_string_literal: true

require 'bencode'

class CachedResult < ApplicationRecord
  validates :n, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, uniqueness: true
  validates :result, presence: true, format: { with: /l(i\d+e)+e/, message: '%<value>s is not valid list of integers' }

  def values
    BEncode.load(self[:result])
        .each_slice(2)
        .map { |x| { x: x[0], xsqr: x[1] } }
        .to_a
  end

  def values=(values)
    self[:result] = values.map { |res| [res[:x], res[:xsqr]] }
                        .flatten
                        .bencode
  end
end
