require_relative "../app/advent.rb"
require_relative "../app/day_9.rb"

RSpec.describe(Day_9) do
  subject(:day) { described_class.new }

  before do
    example = <<~EOF
      7,1
      11,1
      11,7
      9,7
      9,5
      2,5
      2,3
      7,3
    EOF

    allow(File).to receive(:readlines).and_return(example.split(/\n/))
  end

  it 'part 1 returns 50' do
    expect(day.part_1).to eq(50)
  end

  it 'part 2 returns 24' do
    expect(day.part_2).to eq(24)
  end
end
