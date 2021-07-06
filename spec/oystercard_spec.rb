require 'oystercard'

RSpec.describe Oystercard do

  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
    
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe 'changing the balance' do

    it 'adds to the balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it 'raises an error if maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect{ subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end
  end

    context 'status of the card' do

      it 'is initially not in a journey' do
      expect(subject).not_to be_in_journey
      end

     it 'can be activated at the start of a journey' do
       subject.top_up(10)
       subject.touch_in(entry_station)
       expect(subject).to be_in_journey
     end

     it "can be de-activated" do
       subject.top_up(10)
       subject.touch_in(entry_station)
       subject.touch_out(exit_station)
       expect(subject).not_to be_in_journey
     end

      it 'will not activate if below a minimum balance' do
        expect{ subject.touch_in(entry_station) }.to raise_error "Insufficient balance to activate"
      end

      it 'records the entry station on touch in' do
        subject.top_up(10)
        subject.touch_in(entry_station)
        expect(subject.entry_station).to eq entry_station
      end

      let(:journey) { {entry_station: entry_station, exit_station: exit_station} }
      
      it 'stores the journey' do
        subject.top_up(10)
        subject.touch_in(entry_station)
        subject.touch_out(exit_station)
        expect(subject.journeys).to include journey
      end
      
      describe '#touch_out' do
        it 'confirm deduction made on touching out' do
          subject.top_up(10)
          subject.touch_in(entry_station)
          expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-Oystercard::MINIMUM_CHARGE)
        end
        it 'reset entry station to nil upon touching out' do
          subject.top_up(10)
          subject.touch_in(entry_station)
          subject.touch_out(exit_station)
          expect(subject.entry_station).to eq nil
        end
      end
      
    end
end