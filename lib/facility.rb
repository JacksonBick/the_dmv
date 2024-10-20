require 'date'
#require './lib/vehicle.rb'

class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @phone = data[:phone]
    @services = []
    data = {name:, address:, phone:}
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
    #require 'pry'; binding.pry
      vehicle.registration_date = Date.today
      @registered_vehicles << vehicle 
      determine_plate_type_collect_fees(vehicle)
      @registered_vehicles
    end
  end

  #helper methods

  def determine_plate_type_collect_fees(vehicle)
    if vehicle.antique? 
      vehicle.plate_type = :antique
      @collected_fees += 25
    elsif vehicle.electric_vehicle?
      vehicle.plate_type = :electric_vehicle
      @collected_fees += 200
    else 
      vehicle.plate_type = :regular
      @collected_fees += 100
    end
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test')
      if registrant.age >= 16 && registrant.permit == true
        registrant.license_data[:written] = true
      end
    end 
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test')
      if registrant.license_data[:written] == true
        registrant.license_data[:license] = true
      end
    end
  end

  
end