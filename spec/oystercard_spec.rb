require 'oystercard'

RSpec.describe Oystercard do
    
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe 'changing the balance' do

    it 'adds to the balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it 'deducts from the balance' do
      subject.top_up(30)
      expect{ subject.deduct 5 }.to change{ subject.balance }.by -5
    end

    it 'raises an error if maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect{ subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end
    end
end