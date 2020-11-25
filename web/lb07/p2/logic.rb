# frozen_string_literal: true


class Point
  def self.[](x, y)
    Point.new(x, y)
  end

  def initialize(x, y)
    @x = x
    @y = y
  end

  attr_accessor :x
  attr_accessor :y

  def l_to(point)
    Math.sqrt (@x - point.x) ** 2 + (@y - point.y) ** 2
  end
end

class Triangular
  def initialize(point1, point2, point3)
    @a = point1
    @b = point2
    @c = point3
  end

  def square
    p = perimeter / 2.0
    a = @a.l_to @b
    b = @b.l_to @c
    c = @c.l_to @a
    Math.sqrt p * (p - a) * (p - b) * (p - c)
  end

  protected

  def perimeter
    (@a.l_to @b) + (@b.l_to @c) + (@c.l_to @a)
  end
end

class Prism < Triangular
  def initialize(point1, point2, point3, height)
    super point1, point2, point3
    @height = height
  end

  def square_perm
    perimeter * @height
  end
end
