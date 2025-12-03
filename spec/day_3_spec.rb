require_relative "../app/advent.rb"
require_relative "../app/day_3.rb"

RSpec.describe(Day_3) do
  subject(:day) { described_class.new }

  before do
    example = <<~EOF
      987654321111111
      811111111111119
      234234234234278
      818181911112111
    EOF

    allow(File).to receive(:readlines).and_return(example.split("\n"))
  end

  it 'part 1 returns 357' do
    expect(day.part_1).to eq(357)
  end

  it 'part 2 returns 3121910778619' do
    expect(day.part_2).to eq(3121910778619)
  end
end
