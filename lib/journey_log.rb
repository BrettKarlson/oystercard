require_relative 'journey'

class JourneyLog
  attr_reader :journey_class, :entry_station, :exit_station

  def initialize(journey_class = nil)
    @journey_class = journey_class
    @journeys = []
  end

  def start(entry_station)
    @journey_class = Journey.new(entry_station)
  end

  def finish(exit_station)
  end
  


end