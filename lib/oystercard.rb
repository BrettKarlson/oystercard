require_relative 'journey'

class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_CHARGE = 1
  
  attr_reader :balance, :journeys, :journey

  def initialize
    @balance = 0
    @journeys = []
    @journey = Journey.new
  end

  def top_up(amount)
    check_balance(amount)
    @balance += amount
  end

  def check_balance(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
  end
  
  def in_journey?
    !!@journey.entry_station
  end

  def touch_in(entry_station)
    check_min_balance
    @journey = Journey.new(entry_station)
  end

  def check_min_balance
    fail "Insufficient balance to activate" if @balance < MINIMUM_CHARGE
  end

  def touch_out(exit_station)
    @journey.finish(exit_station)
    deduct(@journey.fare)
    record_update
    @journey.reset
  end

  def record_update
    @journeys << { entry_station: @journey.entry_station, exit_station: @journey.exit_station }
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end