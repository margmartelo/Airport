class Airport

    attr_reader :planes, :capacity
    DEFAULT_CAPACITY = 20

    def initialize(capacity=DEFAULT_CAPACITY)
        @planes = []
        @capacity = capacity
       
    end

    def land(plane)
        fail "Landing is not possible: airport at full capacity." if @planes.length == @capacity
        @planes.push(plane)
    end

    def take_off
        fail "Due to stormy weather, it is not possible to take off." if stormy?
        @planes.pop
    end

    def stormy?
        number = rand(1..5)
        if number == 5
            true
        end
    end
end