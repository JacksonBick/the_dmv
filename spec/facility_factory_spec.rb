require 'spec_helper'
require 'rspec'

RSpec.describe FacilityFactory do
  describe 'create_facilities_CO' do
    it 'takes an array of hashes of facility data and makes them into instances of the facility class for colorado' do
      factory = FacilityFactory.new
      co_facilities = DmvDataService.new.co_dmv_office_locations
      working = factory.create_facilities_CO(co_facilities)

      expect(working.first).to be_a(Facility)
      expect(working.length).to eq(5)
      expect(working).to be_an(Array)
      expect(working.last.name).to be_a(String)
      expect(working.first.address).to be_a(String)
      expect(working.first.services).to be_an(Array)
    end
  end

  describe 'create_facilities_NY' do
    it 'takes the data of facilities for NY and turns them into intances of facility class' do
      factory = FacilityFactory.new
      ny_facilities = DmvDataService.new.ny_dmv_office_locations
      working = factory.create_facilities_NY(ny_facilities)

      expect(working.first).to be_a(Facility)
      expect(working.first.name).to be_a(String)
      expect(working.length).to eq(173)
      expect(working.last.address).to be_a(String)
      expect(working.first.phone).to eq(nil)
    end
  end

  describe 'create_facilities_MO' do
    it "takes data from MO DMVs and turns it tnto instances of the facility class" do
      factory = FacilityFactory.new
      mo_facilities = DmvDataService.new.mo_dmv_office_locations
      working = factory.create_facilities_MO(mo_facilities)

      expect(working.length).to eq(177)
      expect(working.first.name).to be_a(String)
      expect(working.last).to be_a(Facility)
      expect(working.last.address).to be_a(String)
      expect(working.first.phone).to be_a(String)
    end
  end
end