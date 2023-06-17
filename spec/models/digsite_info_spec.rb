require "rails_helper"

RSpec.describe DigsiteInfo, type: :model do
  context "create method" do
    let(:digsite_info) {
      create(:digsite_info)
    }

    it "passes validation" do
      expect(digsite_info).to be_valid
    end

    it "fails validation with no near street, adress info and intersection" do
      expect {
        create(:digsite_info, adress_info_id: nil, near_streets_id: nil, intersections_id: nil)
      }.to raise_error(ActiveRecord::NotNullViolation)
    end
  end
end
