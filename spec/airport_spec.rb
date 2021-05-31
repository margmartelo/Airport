#As an air traffic controller 
#So I can get passengers to a destination 
#I want to instruct a plane to land at an airport
require 'airport'

describe Airport do
    it "should allow landing" do
        expect(subject).to respond_to :land
    end
end


