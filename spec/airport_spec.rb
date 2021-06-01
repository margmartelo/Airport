#As the system designer
#So that the software can be used for many different airports
#I would like a default airport capacity that can be overridden as appropriate


require 'airport'
require 'plane'

describe Airport do
    it "should allow landing" do
        expect(subject).to respond_to :land
    end

    it "should allow a plane to land" do
        subject.land(Plane.new)
        expect(subject.planes.length).to eq 1
    end

    it "should raise an error if trying to land at the airport with full capacity reached" do
        subject.capacity.times { subject.land(Plane.new) }
        expect { subject.land(Plane.new) }.to raise_error("Landing is not possible: airport at full capacity.")
    end

    it "should allow to set the capacity of an airport" do
        new_airport = Airport.new(30)
        expect(new_airport.capacity).to eq 30
    end

    it "should allow a plane to take off" do
        3.times { subject.land(Plane.new) }
        subject.take_off
        expect(subject.planes.length).to eq 2
    end

end


