require 'rails_helper'

RSpec.describe ParkService do
  context "instance methods" do
    context "#parks_by_state" do
      it "returns park by given state", :vcr do
        state = 'TN'
        parks = ParkService.parks_by_state(state)
        expect(parks).to have_key(:data)
        expect(parks[:data]).to be_an(Array)
        park_data = parks[:data].first

        expect(park_data).to have_key(:fullName)
        expect(park_data[:fullName]).to be_a(String)

        expect(park_data).to have_key(:description)
        expect(park_data[:description]).to be_a(String)

        expect(park_data).to have_key(:directionsInfo)
        expect(park_data[:directionsInfo]).to be_a(String)

        expect(park_data).to have_key(:operatingHours)
        expect(park_data[:data]).to be_a(Array)
      end
    end
  end
end
