require 'spec_helper'
require 'rspec'
 
RSpec.describe VehicleFactory do
  describe "create_vehicles" do
    it "takes an array of vehicle data and makes them into instances of vehicle class" do
      
      factory = VehicleFactory.new
      vehicles = [{:electric_vehicle_type=>"Battery Electric Vehicle (BEV)",
      :vin_1_10=>"1N4BZ0CP3G",
      :dol_vehicle_id=>"348273537",
      :model_year=>"2016",
      :make=>"NISSAN",
      :model=>"Leaf",
      :vehicle_primary_use=>"Passenger",
      :electric_range=>"84",
      :odometer_reading=>"44004",
      :odometer_code=>"Actual Mileage",
      :new_or_used_vehicle=>"Used",
      :sale_price=>"0.00",
      :date_of_vehicle_sale=>"2024-03-20T00:00:00.000",
      :base_msrp=>"0",
      :transaction_type=>"Transfer Title",
      :transaction_date=>"2024-03-27T00:00:00.000",
      :transaction_year=>"2024",
      :county=>"Jefferson",
      :city=>"PORT TOWNSEND",
      :state_of_residence=>"WA",
      :zip=>"98368",
      :hb_2042_clean_alternative_fuel_vehicle_cafv_eligibility=>"HB 2042 Eligibility Requirements not met",
      :meets_2019_hb_2042_electric_range_requirement=>true,
      :meets_2019_hb_2042_sale_date_requirement=>false,
      :meets_2019_hb_2042_sale_price_value_requirement=>false,
      :_2019_hb_2042_battery_range_requirement=>"Battery range requirement is met",
      :_2019_hb_2042_purchase_date_requirement=>"This transaction type is not eligible for the tax exemption",
      :_2019_hb_2042_sale_price_value_requirement=>"This transaction type is not eligible for the tax exemption",
      :electric_vehicle_fee_paid=>"Not Applicable",
      :transportation_electrification_fee_paid=>"Not Applicable",
      :hybrid_vehicle_electrification_fee_paid=>"Not Applicable",
      :census_tract_2020=>"53031950603",
      :legislative_district=>"24",
      :electric_utility=>"BONNEVILLE POWER ADMINISTRATION||PUGET SOUND ENERGY INC||PUD NO 1 OF JEFFERSON COUNTY"},
     {:electric_vehicle_type=>"Battery Electric Vehicle (BEV)",
      :vin_1_10=>"5YJ3E1EB7K",
      :dol_vehicle_id=>"244708467",
      :model_year=>"2019",
      :make=>"TESLA",
      :model=>"Model 3",
      :vehicle_primary_use=>"Passenger",
      :electric_range=>"220",
      :odometer_reading=>"0",
      :odometer_code=>"Odometer reading is not collected at time of renewal",
      :new_or_used_vehicle=>"New",
      :sale_price=>"0.00",
      :base_msrp=>"0",
      :transaction_type=>"Original Registration",
      :transaction_date=>"2019-02-28T00:00:00.000",
      :transaction_year=>"2019",
      :county=>"King",
      :city=>"BELLEVUE",
      :state_of_residence=>"WA",
      :zip=>"98007",
      :hb_2042_clean_alternative_fuel_vehicle_cafv_eligibility=>"HB 2042 Eligibility Requirements not met",
      :meets_2019_hb_2042_electric_range_requirement=>true,
      :meets_2019_hb_2042_sale_date_requirement=>false,
      :meets_2019_hb_2042_sale_price_value_requirement=>false,
      :_2019_hb_2042_battery_range_requirement=>"Battery range requirement is met",
      :_2019_hb_2042_purchase_date_requirement=>"This transaction type is not eligible for the tax exemption",
      :_2019_hb_2042_sale_price_value_requirement=>"This transaction type is not eligible for the tax exemption",
      :electric_vehicle_fee_paid=>"No",
      :transportation_electrification_fee_paid=>"No",
      :hybrid_vehicle_electrification_fee_paid=>"No",
      :census_tract_2020=>"53033023201",
      :legislative_district=>"48",
      :electric_utility=>"PUGET SOUND ENERGY INC||CITY OF TACOMA - (WA)"},]

      working = factory.create_vehicles(vehicles)

      expect(working.first).to be_a(Vehicle)
      expect(working.length).to eq(2)
      expect(working.last.make).to eq("TESLA")
      expect(working.first.vin).to eq("1N4BZ0CP3G")
      expect(working.first.year).to eq(2016)
      expect(working.last.model).to eq("Model 3")
    end
  end
end