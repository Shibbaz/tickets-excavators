require "rails_helper"

RSpec.describe Contexts::DigsiteInfos::Commands::Build, type: :model do
  describe ".call" do
    let(:adress_info) {
      create(:adress_info)
    }

    let(:near_street) {
      create(:near_street)
    }

    let(:intersection) {
      create(:intersection)
    }

    subject {
      described_class.new({
        WellKnownText: "POLYGON ((144.95 -37.82, 144.97 -37.82, 144.97 -37.81, 144.95 -37.81, 144.95 -37.82))",
        LookUpBy: "look up by",
        LocationType: "location type",
        SubDivision: "sub division"
      })
    }

    it "is successful" do
      expect(subject.call(
        adress_info_id: adress_info.id,
        near_street_id: near_street.id,
        intersection_id: intersection.id
      )).to be_valid
    end
  end
end
