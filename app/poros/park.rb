class Park
  attr_reader :name,
              :description,
              :directions,
              :hours_of_op

  def initialize(attr)
    @name        = attr[:fullName]
    @description = attr[:description]
    @directions  = attr[:directionsInfo]
    @hours_of_op = attr[:operatingHours][0][:standardHours]
  end
end
