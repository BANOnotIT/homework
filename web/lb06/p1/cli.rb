# frozen_string_literal: true

require_relative 'logic'

puts "[.] Loop implementation"

result, iterations = compute 10**-3
puts "sin 3 ~= #{result} (#{iterations} iters.)"

result, iterations = compute 10**-4
puts "sin 3 ~= #{result} (#{iterations} iters.)"


puts "[.] Enum implementation"

result, iterations = compute_with_enum 10**-3
puts "sin 3 ~= #{result} (#{iterations} iters.)"

result, iterations = compute_with_enum 10**-4
puts "sin 3 ~= #{result} (#{iterations} iters.)"
