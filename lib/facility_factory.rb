require './lib/facility'

class FacilityFactory

  def create_facilities_CO(facilities)
    facilities.map do |data|
      Facility.new(
        name: data[:dmv_office],
        address: data[:address_li],
        phone: data[:phone],
        services: Array(data[:services_p]),
      )
    end
  end

  def create_facilities_NY(facilities)
    facilities.map do |data|
      Facility.new(
        name: data[:office_name],
        address: data[:street_address_line_1],
        phone: data[:public_phone_number],
        services: data[:services]
      )
    end
  end
end