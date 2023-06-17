require "rails_helper"

RSpec.describe ServiceArea, type: :model do
  context "create method" do
    let(:service_area) {
      create(:service_area)
    }
    it "passes validation" do
      expect(service_area).to be_valid
    end

    it "expects primary_service_area_codes type" do
      expect(PrimaryServiceAreaCode.find(service_area.primary_service_area_codes_id)).to be_valid
    end

    it "expects additional_service_area_codes type" do
      expect(AdditionalServiceAreaCode.find(service_area.additional_service_area_codes_id)).to be_valid
    end
  end
end
