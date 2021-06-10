#As an air traffic controller 
#To ensure safety 
#I want to prevent landing when weather is storm

require 'airport'
require 'weather'

describe Airport do
    subject(:airport) { described_class.new(weather, 20) }
    let(:plane) { double :plane }
    let(:weather) { double :weather }

    describe "#land" do
        context "when not stormy" do
            before do 
                allow(weather).to receive(:weather_status).and_return("good")
            end

            it "should allow a plane to land" do
                airport.land(plane)
                expect(airport.planes.length).to eq 1
            end

            context "when full capacity reached" do
                it "should raise an error if trying to land " do
                    airport.capacity.times { airport.land(plane) }
                    expect { airport.land(plane) }.to raise_error("Landing is not possible: airport at full capacity.")
                end
            end
        end

        context "when stormy" do
            it "should raise an error if trying to land" do
                allow(weather).to receive(:weather_status).and_return("stormy")
                expect { airport.land(plane) }.to raise_error("Due to stormy weather, it is not possible to land at the airport.")
            end
        end
    end

    describe "#take_off" do 
        context "when not stormy" do
            it "should allow a plane to take off" do
                allow(weather).to receive(:weather_status).and_return("good")
                3.times { airport.land(plane) }
                airport.take_off
                expect(airport.planes.length).to eq 2
            end
        end
        
        context "when stormy" do
            it "shouldn't allow to take off" do
                allow(weather).to receive(:weather_status).and_return("stormy")
                expect { airport.take_off }.to raise_error("Due to stormy weather, it is not possible to take off.")
            end
        end
    end

    it "should allow to set the capacity of an airport" do
        allow(weather).to receive(:weather_status).and_return("good")
        new_airport = Airport.new(weather, 30)
        expect(new_airport.capacity).to eq 30
    end

    it "should have a default capacity if none is set when a new airport is created" do
        allow(weather).to receive(:weather_status).and_return("good")
        new_airport = Airport.new(weather)
        expect(new_airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

  
end


