require_relative "../app/advent.rb"
require_relative "../app/day_6.rb"

RSpec.describe(Day_6) do
  subject(:day) { described_class.new }

  before do
    example = <<~EOF
      123 328  51 64
       45 64  387 23
        6 98  215 314
      *   +   *   +

    EOF

    allow(File).to receive(:readlines).and_return(example.split(/\n/))
  end

  it 'part 1 returns 4277556' do
    expect(day.part_1).to eq(4277556)
  end

  it 'part 2 returns 3263827' do
    expect(day.part_2).to eq(3263827)
  end
end
