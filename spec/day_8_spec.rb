require_relative "../app/advent.rb"
require_relative "../app/day_8.rb"

RSpec.describe(Day_8) do
  subject(:day) { described_class.new }

  before do
    example = <<~EOF
      162,817,812
      57,618,57
      906,360,560
      592,479,940
      352,342,300
      466,668,158
      542,29,236
      431,825,988
      739,650,466
      52,470,668
      216,146,977
      819,987,18
      117,168,530
      805,96,715
      346,949,466
      970,615,88
      941,993,340
      862,61,35
      984,92,344
      425,690,689
    EOF

    allow(File).to receive(:readlines).and_return(example.split(/\n/))
    allow(day).to receive(:max_connections).and_return(10)
  end

  it 'part 1 returns 40' do
    expect(day.part_1).to eq(40)
  end

  it 'part 2 returns 25272' do
    expect(day.part_2).to eq(25272)
  end
end
