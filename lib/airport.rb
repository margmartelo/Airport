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
        @planes.pop
    end
end