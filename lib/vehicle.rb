require 'date'

class Vehicle
  attr_reader :vin, :year, :make, :model, :engine, :p_type

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = nil
    @p_type
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def registration_date
      #Date.today
  end

  def plate_type
    if antique? 
      @p_type = :antique
    elsif electric_vehicle?
      @p_type = :electric_vehicle
    else 
      @p_type = :regular
    end
    @p_type
  end
    
  def collected_fees
    plate_type
    if @p_type == :antique
      25
    elsif @p_type == :electric_vehicle
      200
    elsif @p_type == :regular
      100
    end
  end
end