# frozen_string_literal: true

# require 'math'

# @param [Numeric] z
# @param [Numeric] x
def y_from(x, z)
  (x**2 + 2 * Math::E**x) * Math.cos((6 * z) / x - 5)
end
