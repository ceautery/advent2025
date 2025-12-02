require_relative "../app/advent.rb"
require_relative "../app/day_2.rb"

RSpec.describe(Day_2) do
  subject(:day) { described_class.new }

  before do
    example = "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124"

    allow(File).to receive(:read).and_return(example)
  end

  it 'part 1 returns 1227775554' do
    expect(day.part_1).to eq(1227775554)
  end

  it 'part 2 returns 4174379265' do
    expect(day.part_2).to eq(4174379265)
  end
end
