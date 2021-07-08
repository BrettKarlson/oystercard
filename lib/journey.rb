#require_relative 'oystercard'

class Journey

MINIMUM_CHARGE = 1
PENALTY = 6

attr_reader :entry_station, :exit_station

def initialize(entry_station = nil)
  @entry_station = entry_station
end

def fare
  @journeys.nil? ? 6 : 1
end

def complete?
  !!@entry_station
end

def finish(exit_station)
 @entry_station = nil 
 @exit_station = exit_station
 self
end

end