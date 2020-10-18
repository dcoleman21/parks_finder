class ParksController < ApplicationController

  def index
    # state = params[:state]

    # conn = Faraday.new(url: 'https://developer.nps.gov') do |faraday|
    #   faraday.params[:api_key] = ENV['NPS_API_KEY']
    # end
    # response = conn.get("/api/v1/parks")
    # json = JSON.parse(response.body, symbolize_names: true)
    @parks = ParkFacade.parks_by_state(params[:state])
  end
end
