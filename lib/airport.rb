class Airport

    attr_reader :planes, :capacity

    def initialize
        @planes = []
        @capacity =  20
    end

    def land(plane)
        fail "Landing is not possible: airport at full capacity." if @planes.length == @capacity
        @planes.push(plane)
    end

    def take_off
        @planes.pop
    end
end