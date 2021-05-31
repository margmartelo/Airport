#As an air traffic controller 
#So I can get passengers to a destination 
#I want to instruct a plane to land at an airport
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

end


