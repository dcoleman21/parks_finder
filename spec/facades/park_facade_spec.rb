require 'rails_helper'

describe ParkFacade do
  it "returns array of parks object data", :vcr do
    all_parks = ParkFacade.parks_by_state("TN")
    expect(all_parks).to be_a Array
    expect(all_parks.count).to eq(16)

    park = all_parks.first
    expect(park.name).to be_a(String)
    expect(park.description).to be_a(String)
    expect(park.directions).to be_a(String)
    expect(park.hours_of_op).to be_a(Hash)

    hours = park.hours_of_op
    expect(hours).to have_key :monday
    expect(hours[:monday]).to be_a(String)
    expect(hours).to have_key :tuesday
    expect(hours[:tuesday]).to be_a(String)
    expect(hours).to have_key :wednesday
    expect(hours[:wednesday]).to be_a(String)
    expect(hours).to have_key :thursday
    expect(hours[:thursday]).to be_a(String)
    expect(hours).to have_key :friday
    expect(hours[:friday]).to be_a(String)
    expect(hours).to have_key :saturday
    expect(hours[:saturday]).to be_a(String)
    expect(hours).to have_key :sunday
    expect(hours[:sunday]).to be_a(String)
  end
end
