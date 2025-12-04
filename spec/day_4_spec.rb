require_relative "../app/advent.rb"
require_relative "../app/day_4.rb"

RSpec.describe(Day_4) do
  subject(:day) { described_class.new }

  before do
    example = <<~EOF
      ..@@.@@@@.
      @@@.@.@.@@
      @@@@@.@.@@
      @.@@@@..@.
      @@.@@@@.@@
      .@@@@@@@.@
      .@.@.@.@@@
      @.@@@.@@@@
      .@@@@@@@@.
      @.@.@@@.@.
    EOF

    allow(File).to receive(:readlines).and_return(example.split(/(?<=\n)/))
  end

  it 'part 1 returns 13' do
    expect(day.part_1).to eq(13)
  end

  it 'part 2 returns 43' do
    expect(day.part_2).to eq(43)
  end
end
