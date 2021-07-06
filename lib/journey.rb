class Journey

  def touch_in(entry_station)
    fail "Insufficient balance to touch in" if balance < MINIMUM_CHARGE
    @entry_station = entry_station
    @in_journey = true
  end
  
end