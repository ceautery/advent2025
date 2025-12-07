class Day_7 < Advent
  attr_reader :input
  attr_reader :start_column

  def initialize
    @input = File.readlines("inputs/day_7.txt")
    @start_column = input[0].index('S')
  end

  def part_1
    beam_idxs = [start_column]
    splits = 0

    input.each do |line|
      newbeam_idxs = []
      beam_idxs.each do |idx|
        if line[idx] == '^'
          newbeam_idxs << idx - 1
          newbeam_idxs << idx + 1
          splits += 1
        else
          newbeam_idxs << idx
        end

        beam_idxs = newbeam_idxs.uniq
      end
    end

    splits
  end

  def part_2
    width = input.first.length
    paths = Array.new(width, 0)
    paths[start_column] = 1

    input.each do |line|
      newpaths = Array.new(width, 0)

      paths.each_with_index.reject { |v, i| v.zero? }.each do |v, i|
        if line[i] == '^'
          # No bounds checking is needed here since "^" in the input file never
          # reaches the first or last character of a line
          newpaths[i - 1] += v
          newpaths[i + 1] += v
        else
          newpaths[i] += v
        end
      end

      paths = newpaths
    end

    paths.sum
  end
end
