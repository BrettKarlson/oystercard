require 'station'

RSpec.describe Station do
  let(:station) { Station.new("Euston", 1)}
  it 'returns correct name' do
    expect(station.name).to eq("Euston")
  end

  it 'returns correct zone' do
    expect(station.zone).to eq(1)
  end
end