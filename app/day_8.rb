class Point
  attr_reader :x, :y, :z

  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z
  end

  def distance(other)
    (x2, y2, z2) = other.coords

    # We don't need to know the real distance, we just need to order points by
    # distance, so this omits the expensive square root
    (x - x2) ** 2 + (y - y2) ** 2 + (z - z2) ** 2
  end

  def coords
    [x, y, z]
  end

  def inspect
    coords.to_s
  end
end

class Day_8 < Advent
  require 'pry'

  attr_reader :points

  def max_connections
    1000
  end

  def initialize
    input = File.readlines("inputs/day_8.txt")

    @points = input.map do |line|
      coords = line.split(",").map(&:to_i)
      Point.new(*coords)
    end
  end


  def part_1
    circuits = points.map { |p| [p] }
    combos = points.combination(2).map { |p1, p2| [p1, p2, p1.distance(p2)] }.sort_by(&:last)

    max_connections.times do
      p1, p2, dist = combos.shift
      next if circuits.any? { |c| c.include?(p1) && c.include?(p2) }

      c1, c2 = circuits.select { |c| c.include?(p1) || c.include?(p2) }
      c2.each { |point| c1 << point }
      circuits.delete(c2)
    end

    circuits.map(&:length).sort.last(3).reduce(:*)
  end

  def part_2
    circuits = points.map { |p| [p] }
    combos = points.combination(2).map { |p1, p2| [p1, p2, p1.distance(p2)] }.sort_by(&:last)

    p1 = nil
    p2 = nil

    while circuits.length > 1
      p1, p2, dist = combos.shift
      next if circuits.any? { |c| c.include?(p1) && c.include?(p2) }

      c1, c2 = circuits.select { |c| c.include?(p1) || c.include?(p2) }
      c2.each { |point| c1 << point }
      circuits.delete(c2)
    end

    p1.x * p2.x
  end
end
