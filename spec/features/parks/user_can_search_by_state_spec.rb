require 'rails_helper'

feature "user can search for state parks" do

  scenario "user submits valid state name", :vcr do
    # As a user
    visit root_path

    select "Tennessee", from: :state
    # When I select "Tennessee" from the form
    # (Note: use the existing form)
    click_on "Find Parks"
    # And click on "Find Parks"
    expect(current_path).to eq(parks_path)
    # my path should be "/search" with "state=TN" in the parameters
    expect(page).to have_content("16 Parks")
    # I see the total of parks found
    expect(page).to have_css(".park", count: 16)
    # And for each park I see:
    # - full name of the park
    # - description
    # - direction info
    # - standard hours for operation
    within(first(".park")) do
      expect(page).to have_css(".fullName")
      expect(page).to have_css(".description")
      expect(page).to have_css(".directionsInfo")
      expect(page).to have_css(".operatingHours")
    end
  end
end
