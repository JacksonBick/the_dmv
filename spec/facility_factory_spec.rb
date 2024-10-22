require 'spec_helper'
require 'rspec'

RSpec.describe FacilityFactory do
  describe 'create_facilities' do
    it 'takes an array of hashes of facility data and makes them into instances of the facility class' do

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

      working = factory.create_facilities(facilities)

      expect(working.first).to be_a(Facility)
      expect(working.length).to eq(2)
    end
  end
end