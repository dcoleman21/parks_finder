class ParkFacade
  def self.parks_by_state(state)
    parks_hash = ParkService.parks_by_state(state)
    parks_hash[:data].map do |park_data|
      Park.new(park_data)
    end
  end
end
