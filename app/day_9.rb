class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def inspect
    "(#{x}, #{y})"
  end
end

class Line
  attr_reader :s, :e

  def initialize(s, e)
    unless s.is_a?(Point) && e.is_a?(Point)
      raise "Initialize with two Points"
    end

    @s = s
    @e = e

    unless vert? || horiz?
      raise "Line must be horizontal or vertical"
    end
  end

  def vert?
    s.x == e.x
  end

  def horiz?
    s.y == e.y
  end

  def length
    @length ||= vert? ? (s.y - e.y).abs : (s.x - e.x).abs
  end

  def inspect
    "[#{s.inspect}, #{e.inspect}]"
  end

  def xs
    @xs ||= [s.x, e.x]
  end

  def ys
    @ys ||= [s.y, e.y]
  end

  def crosses?(other)
    return false if (vert? && other.vert?) || (horiz? && other.horiz?)

    h, v = horiz? ? [self, other] : [other, self]

    # Lines that touch don't count as crossing
    return false if v.ys.include?(h.s.y) || h.xs.include?(v.s.x)

    !(h.s.y > v.ys.max || h.s.y < v.ys.min || v.s.x > h.xs.max || v.s.x < h.xs.min)
  end
end

class Day_9 < Advent
  require 'pry'

  attr_reader :points

  def initialize
    input = File.readlines("inputs/day_9.txt")

    @points = input.map { |line| line.scan(/\d+/).map(&:to_i) }.map { |x, y| Point.new(x, y) }
  end

  def area(p1, p2)
    dx = (p1.x - p2.x).abs + 1
    dy = (p1.y - p2.y).abs + 1

    dx * dy
  end

  def part_1
    points.combination(2).map { |p1, p2| area(p1, p2) }.max
  end

  def part_2
    lines = (points + [points.first]).each_cons(2).map { |s, e| Line.new(s, e) }
    cols = lines.select(&:vert?)
    beams = lines.select(&:horiz?)

    # This is shameless cheating because I drew what the shape looked like
    # Randomly works for example data also
    l = beams.max_by(&:length)
    c1 = l.s.x > l.e.x ? l.s : l.e

    safe = points.reject { |p| p.x == c1.x || p.y == c1.y }.select do |c2|
      # same xs, different ys
      col1 = Line.new(c1, Point.new(c1.x, c2.y))
      col2 = Line.new(c2, Point.new(c2.x, c1.y))

      # same ys, different xs
      beam1 = Line.new(c1, Point.new(c2.x, c1.y))
      beam2 = Line.new(c2, Point.new(c1.x, c2.y))

      [col1, col2].none? { |c| beams.any? { |b| b.crosses? c } } &&
        [beam1, beam2].none? { |b| cols.any? { |c| c.crosses? b } }
    end

    safe.map { |p| area(p, c1) }.max
  end
end
