require "rails_helper"

RSpec.describe Contexts::NearStreets::Commands::Build, type: :model do
  describe ".call" do
    let(:itoi) {
      create(:itoi)
    }
    subject {
      described_class.new({
        State: "State",
        County: "County",
        Place: "Place",
        Prefix: "Prefix",
        Name: "Name",
        Type: "Type",
        Suffix: "Suffix"
      })
    }

    it "is successful" do
      result = subject.call
      expect(result).to be_valid
      expect(result.class).to be(NearStreet)
      expect(result.state).to eq("State")
      expect(result.county).to eq("County")
      expect(result.place).to eq("Place")
      expect(result.prefix).to eq("Prefix")
      expect(result.name).to eq("Name")
      expect(result.dig_type).to eq("Type")
      expect(result.suffix).to eq("Suffix")
    end
  end
end
