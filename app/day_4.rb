class Day_4 < Advent
  attr_reader :input

  def initialize
    @input = File.readlines("inputs/day_4.txt").map { |line| line.strip.chars }
  end

  def neighbor_count(x, y)
    return nil if x < 0 || y < 0 # enforcing bounds by breaking things

    neighbors = (y-1..y+1).to_a.product((x-1..x+1).to_a) - [[y, x]]
    neighbors.count { |y, x| y >= 0 && y < input.length && x >= 0 && input[y][x] == "@" }
  end

  def part_1
    (0...input.length).sum do |y|
      (0...input.first.length).count do |x|
        input[y][x] == "@" && neighbor_count(x, y) < 4
      end
    end
  end

  def part_2
    total_removed = 0
    keep_going = true

    while(keep_going) do
      keep_going = false

      (0...input.length).each do |y|
        (0...input.first.length).each do |x|
          next unless input[y][x] == "@" && neighbor_count(x, y) < 4

          # The puzzle description couches removing rolls in terms of "rounds", where you would identify all the rolls
          # that can be removed this round, then remove them, similar to how you'd program a Conway's Game of Life app.
          # In this puzzle, setting each roll to removed the first time it _can_ be gets you the same total as removing
          # in bulk by rounds.
          input[y][x] = "x"
          total_removed += 1
          keep_going = true
        end
      end
    end

    total_removed
  end
end
