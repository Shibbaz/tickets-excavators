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
      expect(subject.call).to be_valid
    end
  end
end
