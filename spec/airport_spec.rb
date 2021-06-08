
#As an air traffic controller 
#To ensure safety 
#I want to prevent takeoff when weather is stormy 

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

    it "should have a default capacity if none is set when a new airport is created" do
        new_airport = Airport.new
        expect(new_airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "should allow a plane to take off if weather isn't stormy" do
        allow(subject).to receive(:stormy?).and_return(false)
        3.times { subject.land(Plane.new) }
        subject.take_off
        expect(subject.planes.length).to eq 2
    end

    it "shouldn't take off if weather is stormy" do
        allow(subject).to receive(:stormy?).and_return(true)
        expect { subject.take_off }.to raise_error("Due to stormy weather, it is not possible to take off.")
    end
end


