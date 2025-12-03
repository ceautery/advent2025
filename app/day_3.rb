class Day_3 < Advent

  attr_reader :input

  def initialize
    @input = File.readlines("inputs/day_3.txt").map(&:strip)
  end

  def max_joltage(line, len)
    list = line.chars.each_with_index.to_a
    last = 0
    max_str = len.downto(1).map do |n|
      max = list[last..-n].max_by { |c, i| c }
      last = max[1] + 1
      max[0]
    end

    max_str.join.to_i
  end

  # Input lines are 100 chars
  # C(100, 2) is 4950 combinations per line, which is fine.
  # C(100, 12) is 1,050,421,051,106,700 (one quadrillion), which is too large
  # for a naive brute force solution, so we need a more clever approach.
  def old_logic(line, combo_size)
    line.chars.combination(combo_size).map { |p| p.join.to_i }.max
  end

  def part_1
    input.map { |line| max_joltage(line, 2) }.sum
  end

  def part_2
    input.map { |line| max_joltage(line, 12) }.sum
  end
end
