require "rails_helper"

RSpec.describe Contexts::AdressInfos::Commands::Build, type: :model do
  describe ".call" do
    let(:adress_digsite) {
      create(:adress_digsite)
    }

    let(:street_digsite) {
      create(:street_digsite)
    }

    subject {
      described_class.new({
        State: "State",
        County: "County",
        Place: "Place",
        Zip: "Zip"
      })
    }
    it "is successful" do
      result = subject.call(
        adress_id: adress_digsite.id,
        street_id: street_digsite.id
      )
      expect(result).to be_valid
      expect(result.class).to be(AdressInfo)
      expect(result.state).to eq("State")
      expect(result.county).to eq("County")
      expect(result.place).to eq("Place")
      expect(result.zip).to eq("Zip")
    end
  end
end
