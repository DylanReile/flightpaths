class FlightPath
  def initialize(tickets)
    @tickets = tickets
  end

  def airport_endpoints
    [initial_departure_airport, final_arrival_airport]
  end

  private

  def initial_departure_airport
    airport_frequency.key(1)
  end

  def final_arrival_airport
    airport_frequency.key(-1)
  end

  def airport_frequency
    # O(n) time complexity
    # Airports with both a departure (1) and an arrival (-1) will map to 0 values.
    # The departure without an arrival will map to 1.
    # The arrival without a departure will map to -1.
    @airport_frequency ||= @tickets.each_with_object(Hash.new(0)) do |ticket, hash|
      hash[ticket[0]] += 1
      hash[ticket[1]] -= 1   
    end
  end
end
