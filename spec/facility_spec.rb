require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    #@services = ['Vehicle Registration']
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe 'register_vehicle' do
    it "adds registered vehicles to the registered vehicles array" do
      @facility.add_service('Vehicle Registration')
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet',model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      expect(@facility.registered_vehicles).to eq([])
      @facility.register_vehicle(cruz)
      expect(@facility.registered_vehicles).to eq([cruz])
      @facility.register_vehicle(bolt)
      expect(@facility.registered_vehicles).to eq([cruz, bolt])
    end
    it "tells date of registration" do
      @facility.add_service('Vehicle Registration')
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet',model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      expect(cruz.registration_date).to eq(nil)
      expect(bolt.registration_date).to eq(nil)
      @facility.register_vehicle(cruz)
      @facility.register_vehicle(bolt)
      expect(cruz.registration_date).to eq(Date.today)
      expect(bolt.registration_date).to eq(Date.today)
    end

    it 'tells the fees collected based on plate_type' do
      @facility.add_service('Vehicle Registration')
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet',model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      expect(@facility.collected_fees).to eq(0)
      @facility.register_vehicle(cruz)
      expect(@facility.collected_fees).to eq(100)
      @facility.register_vehicle(bolt)
      expect(@facility.collected_fees).to eq(300)
    end
    it 'tells what type of plate a vehicle has' do
      @facility.add_service('Vehicle Registration')
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet',model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      @facility.register_vehicle(cruz)
      @facility.register_vehicle(bolt)
      expect(cruz.plate_type).to eq(:regular)
      expect(bolt.plate_type).to eq(:electric_vehicle)
    end
  end

  describe "administer_written_test" do 
    it "changes license data to show if registrant has written test" do
      @facility.add_service('Written Test')
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15, true )
      @facility.administer_written_test(registrant_1)
      @facility.administer_written_test(registrant_2)
      @facility.administer_written_test(registrant_3)
      
      expect(registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      expect(registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe "administer_road_test" do
    it "changes license data to show if registrant done a road test" do
      @facility.add_service('Written Test')
      @facility.add_service('Road Test')
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15, true )
      @facility.administer_written_test(registrant_1)
      @facility.administer_written_test(registrant_2)
      @facility.administer_written_test(registrant_3)
      @facility.administer_road_test(registrant_1)
      @facility.administer_road_test(registrant_2)
      @facility.administer_road_test(registrant_3)

      expect(registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
      expect(registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe "renew_drivers_license" do
    it "changes license data to show if license was renewed" do
      @facility.add_service('Written Test')
      @facility.add_service('Road Test')
      @facility.add_service('Renew License')
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15, true )
      @facility.administer_written_test(registrant_1)
      @facility.administer_written_test(registrant_2)
      @facility.administer_written_test(registrant_3)
      @facility.administer_road_test(registrant_1)
      @facility.administer_road_test(registrant_2)
      @facility.administer_road_test(registrant_3)
      @facility.renew_drivers_license(registrant_1)
      @facility.renew_drivers_license(registrant_2)
      @facility.renew_drivers_license(registrant_3)

      expect(registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
      expect(registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end
end
