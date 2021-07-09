class Journey
    attr_reader :entry_station, :exit_station, :current
    def initialize
        @entry_station
        @exit_station
        @current = {entry_station: nil, exit_station: nil}
    end

    def start_journey(station)
        @entry_station = station
        @current[:entry_station] = station
    end

    def end_journey(station)
        @exit_station = station
        @current[:exit_station] = station
    end

    def is_complete?
        if current[:entry_station] != nil && current[:exit_station] != nil
            true
        elsif current[:entry_station] == nil || current[:exit_station] == nil
            false
        end
    end

    def fare
        if is_complete? == true
            Oystercard::PRICE
        elsif is_complete? == false
            Oystercard::PENALTY
        end
    end

end