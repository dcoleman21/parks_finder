class ParkService
  def self.parks_by_state(state)
    to_json('/api/v1/parks', stateCode: state)
  end

  private

  def self.to_json(url, params = {})
    response = conn.get(url) do |f|
      f.params = params
      f.params[:api_key] = ENV['NPS_API_KEY']
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://developer.nps.gov')
  end
end
