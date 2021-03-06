
class Journey

MINIMUM_CHARGE = 1
PENALTY = 6

attr_accessor :entry_station, :exit_station

# def initialize
#   @entry_station
#   @exit_station
#   @current = {entry_station: nil, exit_station: nil}
# end

def initialize(entry_station = nil)
  @entry_station = entry_station
end

def fare
  @entry_station && @exit_station ? 1 : 6
end

def reset
  @entry_station = @exit_station = nil
end

def complete?
  !!@entry_station
end

def finish(exit_station)
 @exit_station = exit_station
end

end