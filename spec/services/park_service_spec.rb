require 'rails_helper'

RSpec.describe ParkService do

  it "returns park by given state", :vcr do
    state = 'TN'
    parks = ParkService.parks_by_state(state)
    expect(parks).to have_key(:data)
    expect(parks[:data]).to be_an(Array)
    expect(parks[:data].first).to have_key(:fullName)
    expect(parks[:data].first).to have_key(:description)
    expect(parks[:data].first).to have_key(:directionsInfo)
    expect(parks[:data].first).to have_key(:operatingHours)
  end
end
