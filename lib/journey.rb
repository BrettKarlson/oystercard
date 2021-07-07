require_relative 'oystercard'

class Journey

MINIMUM_CHARGE = 1
PENALTY = 6
attr_reader :entry_station

def initialize(entry_station = nil)
  @entry_station = entry_station
 
end

def fare
  @journeys.nil? ? 6 : 1
end

def complete?

end
def finish(exit_station)
  self 
end

end