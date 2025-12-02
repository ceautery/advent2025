class Day_2 < Advent

  attr_reader :ranges

  def initialize
    input = File.read("inputs/day_2.txt")
    @ranges = input.split(",").map { |r| Range.new(*r.scan(/\d+/)) }
  end

  def part_1
    invalid = ranges.map { |r| r.select { |e| e.match?(/^(\d+)\1$/) } }

    invalid.flatten.map(&:to_i).sum
  end

  def part_2
    invalid = ranges.map { |r| r.select { |e| e.match?(/^(\d+)(\1)+$/) } }

    invalid.flatten.map(&:to_i).sum
  end
end
