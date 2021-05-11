input = 'asdf fdOisa qEwr vecxz'

vowels = 'aeiouy'

result = input.split
              .each_with_index.select { |el, idx| idx.odd? }
              .flat_map { |a, idx| a.chars }
              .select { |a| vowels.include? a.downcase }
              .uniq.sort { |a, b| a.downcase <=> b.downcase }
puts result

arr = gets.chomp.split.map(&:to_i)
to_do = arr.any?(&:odd?) ? arr.take_while(&:odd?) : arr[1..arr.size - 2]
to_do.inject(0, &:+)
