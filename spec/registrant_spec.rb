require './lib/registrant'

RSpec.describe Registrant do
  it "makes a new registrant with a name, age, and do they have a permit" do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15,)

    expect(registrant_1.name).to eq('Bruce')
    expect(registrant_2.age).to eq(15)
    expect(registrant_2.permit).to eq(nil)
    expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    expect(registrant_1.permit).to eq(true)
  end
  describe "permit?" do
    it "asks if the registrant has a permit" do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15,)

      expect(registrant_1.permit?).to eq(true)
      expect(registrant_2.permit?).to eq(nil)
    end
  end
end