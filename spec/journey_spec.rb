require 'journey'
require 'oystercard'

RSpec.describe Journey do

  let(:minimum) { Oystercard::MINIMUM_CHARGE }
  let(:card) { Oystercard.new }
  let(:penalty) { Journey::PENALTY}
  let(:station) { double :station, zone: 1}

  describe '#fare' do

    it 'deducts default penalty fare' do
      card.top_up(20)
      expect(subject.fare).to eq(penalty)
    end
  end

  it "knows if a journey is not complete" do
    expect(subject).not_to be_complete
  end

    context 'given an entry station' do
      subject { described_class.new(station) } #revise explicit subject
  
      it 'has an entry station' do
        expect(subject.entry_station).to eq station
      end

    it "returns a penalty fare if no exit station given" do
      expect(subject.fare).to eq penalty
    end

    context 'given an exit station' do
      let(:other_station) { double :other_station }

      before do
        subject.finish(other_station)
      end

      it 'calculates a fare' do
        journey = Journey.new(other_station)
        journey.finish(station)
        expect(subject.fare).to eq 1
      end

    end

  end
end