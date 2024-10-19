class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @phone = data[:phone]
    @services = []
    data = {name:, address:, phone:}
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    @registered_vehicles << vehicle 
  end
 
  def collected_fees
    
  end
end

