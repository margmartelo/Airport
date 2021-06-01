#As an air traffic controller 
#So I can get passengers on the way to their destination 
#I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport


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

    it "should allow a plane to take off" do
        3.times { subject.land(Plane.new) }
        subject.take_off
        expect(subject.planes.length).to eq 2
    end

end


