require './lib/vehicle'

class VehicleFactory

  def create_vehicles(registrations)
    registrations.map do |data|
      Vehicle.new(
        vin: data[:vin_1_10],
        year: data[:model_year].to_i,
        make: data[:make],
        model: data[:model],
        engine: data[:engine]
      )
    end
  end
end