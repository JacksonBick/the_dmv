require 'spec_helper'
require 'rspec'

RSpec.describe FacilityFactory do
  describe 'create_facilities_CO' do
    it 'takes an array of hashes of facility data and makes them into instances of the facility class for colorado' do

      factory = FacilityFactory.new
      facilities = [{:the_geom=>{:type=>"Point", :coordinates=>[-104.97443112500002, 39.75525297420336]},
      :dmv_id=>"1",
      :dmv_office=>"DMV Tremont Branch",
      :address_li=>"2855 Tremont Place",
      :address__1=>"Suite 118",
      :city=>"Denver",
      :state=>"CO",
      :zip=>"80205",
      :phone=>"(720) 865-4600",
      :hours=>"Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.",
      :services_p=>"vehicle titles, registration, renewals;  VIN inspections",
      :parking_no=>"parking available in the lot at the back of the bldg (Glenarm Street)",
      :photo=>"images/Tremont.jpg",
      :address_id=>"175164",
      :":@computed_region_nku6_53ud"=>"1444"},
     {:the_geom=>{:type=>"Point", :coordinates=>[-104.84839592880655, 39.78135984611333]},
      :dmv_id=>"2",
      :dmv_office=>"DMV Northeast Branch",
      :address_li=>"4685 Peoria Street",
      :address__1=>"Suite 101",
      :location=>"Arie P. Taylor  Municipal Bldg",
      :city=>"Denver",
      :state=>"CO",
      :zip=>"80239",
      :phone=>"(720) 865-4600",
      :hours=>"Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.",
      :services_p=>"vehicle titles, registration, renewals;  VIN inspections",
      :parking_no=>"parking available in both the front and back of the bldg; also on Paris Street",
      :photo=>"images/Peoria.jpg",
      :address_id=>"11348",
      :":@computed_region_nku6_53ud"=>"1444"}]

      working = factory.create_facilities_CO(facilities)

      expect(working.first).to be_a(Facility)
      expect(working.length).to eq(2)
      expect(working.last.name).to eq("DMV Northeast Branch")
      expect(working.first.address).to eq("2855 Tremont Place")
      expect(working.first.services).to eq(["vehicle titles, registration, renewals;  VIN inspections"])
    end
  end

  describe 'create_facilities_NY' do
    it 'takes the data of facilities for NY and turns them into intances of facility class' do

      factory = FacilityFactory.new
      facilities = [{:office_name=>"LAKE PLACID",
      :office_type=>"COUNTY OFFICE",
      :street_address_line_1=>"2693 MAIN STREET",
      :city=>"LAKE PLACID",
      :state=>"NY",
      :zip_code=>"12946",
      :monday_beginning_hours=>"CLOSED",
      :monday_ending_hours=>"CLOSED",
      :georeference=>{:type=>"Point", :coordinates=>[-73.982492701, 44.282282462]},
      :":@computed_region_yamh_8v7k"=>"430",
      :":@computed_region_wbg7_3whc"=>"275",
      :":@computed_region_kjdx_g34t"=>"2084"},
     {:office_name=>"HUDSON",
      :office_type=>"COUNTY OFFICE",
      :public_phone_number=>"5188283350",
      :street_address_line_1=>"560 WARREN STREET",
      :city=>"HUDSON",
      :state=>"NY",
      :zip_code=>"12534",
      :monday_beginning_hours=>"9:00 AM",
      :monday_ending_hours=>"4:45 PM",
      :tuesday_beginning_hours=>"9:00 AM",
      :tuesday_ending_hours=>"4:45 PM",
      :wednesday_beginning_hours=>"9:00 AM",
      :wednesday_ending_hours=>"4:45 PM",
      :thursday_beginning_hours=>"9:00 AM",
      :thursday_ending_hours=>"6:45 PM",
      :friday_beginning_hours=>"9:00 AM",
      :friday_ending_hours=>"4:45 PM",
      :georeference=>{:type=>"Point", :coordinates=>[-73.784493121, 42.248260478]},
      :":@computed_region_yamh_8v7k"=>"515",
      :":@computed_region_wbg7_3whc"=>"977",
      :":@computed_region_kjdx_g34t"=>"619"}]

      working = factory.create_facilities_NY(facilities)

      expect(working.first).to be_a(Facility)
      expect(working.first.name).to eq("LAKE PLACID")
      expect(working.length).to eq(2)
      expect(working.last.address).to eq("560 WARREN STREET")
      expect(working.first.phone).to eq(nil)
    end
  end
end