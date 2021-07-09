require 'journey_log'
require 'journey'

RSpec.describe JourneyLog do
  let(:station) { double :station }
  #let(:exit_station) { double :exit_station }

  it { is_expected.to respond_to(:start).with(1).argument }

  it 'stores the entry station' do
    subject.start(station)
    expect(subject.journey_class.entry_station).to eq(station)
  end

  
  it { is_expected.to respond_to(:finish).with(1).argument }

#  it 'records the exit station' do
#     subject.start(station)
#     subject.finish(exit_station)
#     expect(subject.journey_class.exit_station).to eq(exit_station)
#   end
   
#   let(:journey){ double :journey } #this may need to have some methods
#   let(:entry_station){ double :entry_station }
#   let(:journey_class){double :journey_class, new: journey}
#   subject {described_class.new(journey_class:journey_class)} 

#  describe '#start' do
#   subject { JourneyLog.new }
#     it 'starts a journey' do
#       expect(@journey_class).to receive(:start).with(entry_station: @entry_station)
#       subject.start(@entry_station)
#     end
#    end




end