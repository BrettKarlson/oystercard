require_relative 'journey'

class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_CHARGE = 1

  attr_reader :balance, :entry_station, :journeys

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end
  
  def in_journey?
    !!@entry_station
  end

  def touch_in(entry_station)
    fail "Insufficient balance to activate" if balance < MINIMUM_CHARGE
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_CHARGE)
    @journeys << { entry_station: @entry_station, exit_station: exit_station }
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end