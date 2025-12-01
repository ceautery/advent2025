class Day_1 < Advent
  attr_reader :turns

  def initialize
    lines = File.readlines("inputs/day_1.txt")
    @turns = lines.map do |line|
      match = line.match(/([LR])(\d+)/)
      # Final results should be the same if we check for R or L here
      match[1] == "R" ? match[2].to_i * -1 : match[2].to_i
    end
  end

  def part_1
    pos = 50
    turns.count do |turn|
      pos = (pos + turn) % 100
      pos == 0
    end
  end

  def part_2
    pos = 50
    zeroes = 0
    turns.each do |turn|
      next_pos = pos + turn
      if next_pos >= 100
        zeroes += (next_pos / 100)
      elsif next_pos <= 0
        zeroes += 1 unless pos == 0
        zeroes += (next_pos / -100)
      end

      pos = next_pos % 100
    end

    zeroes
  end
end
