require_relative "../app/advent.rb"
require_relative "../app/day_5.rb"

RSpec.describe(Day_5) do
  subject(:day) { described_class.new }

  before do
    example = <<~EOF
      3-5
      10-14
      16-20
      12-18

      1
      5
      8
      11
      17
      32
    EOF

    allow(File).to receive(:read).and_return(example)
  end

  it 'part 1 returns 3' do
    expect(day.part_1).to eq(3)
  end

  it 'part 2 returns 14' do
    expect(day.part_2).to eq(14)
  end
end
