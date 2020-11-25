# frozen_string_literal: true

def compute(delta)
  result = 3.0
  i = 1

  until (Math.sin(3) - result).abs <= delta
    r = i * 2.0 + 1
    el = (3.0**r) / frac(r).to_f
    result += i.odd? ? -el : el
    i += 1
  end

  [result, i]
end

def compute_with_enum(delta)
  t = (0..Float::INFINITY)
      .lazy
      .map do |i|
        r = i * 2.0 + 1
        x = (3.0**r) / frac(r).to_f
        i.even? ? x : -x
      end
      .take_while { |x| x.abs >= delta }

  [t.inject(:+), t.to_a.size]
end

def frac(x)
  (1..Float::INFINITY).lazy.take(x).inject(:*)
end
