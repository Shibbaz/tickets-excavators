require "rails_helper"

RSpec.describe Contexts::StreetDigsites::Commands::Build, type: :model do
  describe ".call" do
    let(:primary_service_area_code) {
      create(:primary_service_area_code)
    }

    let(:additional_service_area_code) {
      create(:additional_service_area_code)
    }

    subject {
      described_class.new({
        Prefix: "Prefix",
        Name: "Name",
        Type: "Type",
        Suffix: "Suffix"
      })
    }

    it "is successful" do
      result = subject.call
      expect(result).to be_valid
      expect(result.class).to be(StreetDigsite)
      expect(result.prefix).to eq("Prefix")
      expect(result.name).to eq("Name")
      expect(result.dig_type).to eq("Type")
      expect(result.suffix).to eq("Suffix")
    end
  end
end
