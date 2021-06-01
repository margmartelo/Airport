class Airport

    attr_reader :planes

    def initialize
        @planes = []
    end

    def land(plane)
        @planes.push(plane)
    end

    def take_off
        @planes.pop
    end
end