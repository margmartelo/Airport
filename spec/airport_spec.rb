#As an air traffic controller 
#To ensure safety 
#I want to prevent landing when weather is storm

require 'airport'

describe Airport do
    let(:plane) { double :plane }
    describe "#land" do
        context "when not stormy" do
            before do 
                allow(subject).to receive(:stormy?).and_return(false)
            end

            it "should allow a plane to land" do
                subject.land(plane)
                expect(subject.planes.length).to eq 1
            end

            context "when full capacity reached" do
                it "should raise an error if trying to land " do
                    subject.capacity.times { subject.land(plane) }
                    expect { subject.land(plane) }.to raise_error("Landing is not possible: airport at full capacity.")
                end
            end
        end

        context "when stormy" do
            it "should raise an error if trying to land" do
                allow(subject).to receive(:stormy?).and_return(true)
                expect { subject.land(plane) }.to raise_error("Due to stormy weather, it is not possible to land at the airport.")
            end
        end
    end

    describe "#take_off" do 
        context "when not stormy" do
            it "should allow a plane to take off" do
                allow(subject).to receive(:stormy?).and_return(false)
                3.times { subject.land(plane) }
                subject.take_off
                expect(subject.planes.length).to eq 2
            end
        end
        
        context "when stormy" do
            it "shouldn't allow to take off" do
                allow(subject).to receive(:stormy?).and_return(true)
                expect { subject.take_off }.to raise_error("Due to stormy weather, it is not possible to take off.")
            end
        end
    end

    it "should allow to set the capacity of an airport" do
        new_airport = Airport.new(30)
        expect(new_airport.capacity).to eq 30
    end

    it "should have a default capacity if none is set when a new airport is created" do
        new_airport = Airport.new
        expect(new_airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

  
end


