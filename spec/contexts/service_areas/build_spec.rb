require "rails_helper"

RSpec.describe Contexts::ServiceAreas::Commands::Build, type: :model do
  describe ".call" do
    let(:primary_service_area_code) {
      create(:primary_service_area_code)
    }

    let(:additional_service_area_code) {
      create(:additional_service_area_code)
    }

    subject { described_class.new }

    it "is successful" do
      result = subject.call(
        primary_service_area_codes_id: primary_service_area_code.id,
        additional_service_area_codes_id: additional_service_area_code.id
      )
      expect(result).to be_valid
      expect(result.class).to be(ServiceArea)
      expect(result.primary_service_area_codes_id).to eq(primary_service_area_code.id)
      expect(result.additional_service_area_codes_id).to eq(additional_service_area_code.id)

    end
  end
end
