# frozen_string_literal: true

require_relative 'logic'

a = Point[0, 0]
b = Point[2, 2]
c = Point[0, 2]

tri = Triangular.new a, b, c
puts tri.inspect
puts "Triangular square: #{tri.square}"

prism = Prism.new a, b, c, 4
puts "Prism square: #{prism.square_perm}"
