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

  describe 'create_facilities_MO' do
    it "takes data from MO DMVs and turns it tnto instances of the facility class" do
      factory = FacilityFactory.new
      facilities = [{:number=>"059",
      :dorregionnumber=>"5",
      :type=>"1MV",
      :name=>"FERGUSON-OFFICE CLOSED UNTIL FURTHER NOTICE",
      :address1=>"10425 WEST FLORISSANT",
      :city=>"FERGUSON",
      :state=>"MO",
      :zipcode=>"63136",
      :located_in=>"Personalized plates can be picked up at the North County License Office. ",
      :county=>"St. Louis County",
      :phone=>"(314) 733-5316",
      :fax=>"(314) 733-5319",
      :size=>"3",
      :email=>"FERGUSONAGENTOFFICE@DOR.MO.GOV",
      :latlng=>{:latitude=>"38.737935", :longitude=>"-90.220029"},
      :textingphonenumber=>"(314) 730-0606",
      :additional_license_office_info=>
      "Personalized plates can be picked up at the North County License office located at 11700 W Florissant, St. Louis, MO 63033.",
      :":@computed_region_ny2h_ckbz"=>"203",
      :":@computed_region_c8ar_jsdj"=>"51",
      :":@computed_region_ikxf_gfzr"=>"2210"},
    {:number=>"066",
      :dorregionnumber=>"4",
      :type=>"1MV",
      :name=>"BUTLER",
      :address1=>"105 N ORANGE ST",
      :city=>"BUTLER",
      :state=>"MO",
      :zipcode=>"64730",
      :county=>"Bates",
      :phone=>"(660) 679-0061",
      :fax=>"(660) 679-0185",
      :size=>"1",
      :email=>"Butler.LicenseOffice@lo.mo.gov",
      :agent=>"LICENSE OFFICE SERVICES, LLC",
      :officemanager=>"ASHLEY ISAACSON",
      :daysopen=>"Monday - Friday - 8:30 to 4:30, Last Saturday  - 9:00 to 12:00",
      :holidaysclosed=>
      "Christmas Day Observed (12/25/23), New Year's Day (1/1/24), Martin Luther King Jr. Day (1/15/24), Lincoln's Birthday (2/12/24)
    , President's Day (2/19/24), Truman's Birthday (5/8/24), Memorial Day (5/27/24), Juneteenth (6/19/24), Independence Day (7/4/24), 
    Labor Day (9/2/24), Columbus Day (10/14/24), Veterans Day (11/11/24), Thanksgiving Day (11/28/24), Christmas Day (12/25/24)",
      :additionaldaysclosed=>
      "1/17/2023,         3/31/2023 (at 4:00 PM ),        5/27/2023,           7/3/23,       9/29/2023 (at 1:00 PM ),           11/22
    /23,           11/24/23,      11/25/2023,           12/26/23,     1/22/2024,    3/19/2024 (at 10:00 AM until 12:00 PM ),    3/19/2
    024 (open at 12:00 PM ),   4/1/2024 (at 12:30 PM ),     07/05/2024,  7/19/2024 (at 10:00 AM ),     11/29/2024,     12/24/2024",
      :latlng=>{:latitude=>"38.25987", :longitude=>"-94.34308"}}]

      working = factory.create_facilities_MO(facilities)

      expect(working.length).to eq(2)
      expect(working.first.name).to eq("FERGUSON-OFFICE CLOSED UNTIL FURTHER NOTICE")
      expect(working.last).to be_a(Facility)
      expect(working.last.address).to eq("105 N ORANGE ST")
      expect(working.first.phone).to eq("(314) 733-5316")
    end
  end
end