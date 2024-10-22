require './lib/facility'

class FacilityFactory

  def create_facilities(facilities)
    facilities.map do |data|
      Facility.new(
        name: data[:dmv_office],
        address: data[:address_li],
        phone: data[:phone],
        services: data[:services_p],
      )
    end
  end
end