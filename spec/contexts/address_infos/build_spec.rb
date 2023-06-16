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
      expect(subject.call(
        adress_id: adress_digsite.id,
        street_id: street_digsite.id
      )).to be_valid
    end
  end
end
