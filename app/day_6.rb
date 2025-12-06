class Day_6 < Advent
  attr_reader :input

  def initialize
    @input = File.readlines("inputs/day_6.txt")
  end

  def part_1
    operations = input[-1].scan /\S/
    rows = input[0..-2].map { |line| line.scan(/\d+/).map(&:to_i) }

    operations.each_with_index.sum do |o, i|
      nums = rows.map { |row| row[i] }
      o == '+' ? nums.reduce(:+) : nums.reduce(:*)
    end
  end

  def part_2
    # I decided to use ruby's built-in matrix rotation Array#transpose, which
    # requires a square array-of-arrays. The input lines are unevenm so the
    # first thing to do is pad them out to the same length
    max_line_length = input.map(&:length).max
    padded = input.map { |line| line.ljust(max_line_length).chars }

    # Now I can safely transpose, then map over join to turn this back into an
    # array of strings. That will lead to a set of math problems seperated by
    # a string of just spaces, e.g.
    # 1  *
    # 24
    # 356
    #
    # 369+
    # 248
    # 8
    transposed = padded.transpose.map { |row| row.join }

    # Only consider lines that have numbers
    with_nums = transposed.grep /\d/

    total = 0
    op = ''
    nums = []

    with_nums.each do |line|
      if line.match? /[*+]$/
        # solve previous math problem, if any
        total += op == '+' ? nums.reduce(:+) : nums.reduce(:*) unless nums.empty?

        op = line[-1]
        nums = []
      end

      nums << line.to_i
    end

    # ...and finish by solving the last problem in the set
    total += op == '+' ? nums.reduce(:+) : nums.reduce(:*)
  end
end
