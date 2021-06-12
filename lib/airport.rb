class Airport

    attr_reader :planes, :capacity
    DEFAULT_CAPACITY = 20

    def initialize(weather, capacity=DEFAULT_CAPACITY)
        @weather = weather.weather_status
        @capacity = capacity
        @planes = []
       
    end

    def land(plane)
        fail "Due to stormy weather, it is not possible to land at the airport." if stormy?
        fail "Landing is not possible: airport at full capacity." if @planes.length == @capacity
        @planes.push(plane)
    end

    def take_off(plane)
        fail "Due to stormy weather, it is not possible to take off." if stormy?
        fail "This plane is currently not at this airport." unless @planes.include?(plane)
        @planes.pop
    end

    private

    def stormy?
        @weather == "stormy"
    end 

end