require "rails_helper"

RSpec.describe ExcavationInfo, type: :model do
  context "create method" do
    let(:excavation_info) {
      create(:excavation_info)
    }

    it "passes validation" do
      expect(excavation_info).to be_valid
    end

    it "fails validation with no digsite_info" do
      expect {
        create(:excavation_info, digsite_infos_id: nil)
      }.to raise_error(ActiveRecord::NotNullViolation)
    end

    it "expects presence of type_of_work" do
      expect(excavation_info[:type_of_work].class).to be(String)
    end

    it "expects presence of work_done_for" do
      expect(excavation_info[:work_done_for].class).to be(String)
    end

    it "expects presence of project duration" do
      expect(excavation_info[:project_duration].class).to be(String)
    end

    it "expects presence of project_start_date" do
      expect(excavation_info[:project_start_date].class).to be(ActiveSupport::TimeWithZone)
    end

    it "expects presence of explosives" do
      expect(excavation_info[:explosives].class).to be(String)
    end

    it "expects presence of under_ground_over_head" do
      expect(excavation_info[:under_ground_over_head].class).to be(String)
    end

    it "expects presence of horizontal_boring" do
      expect(excavation_info[:horizontal_boring].class).to be(String)
    end

    it "expects presence of white_lined" do
      expect(excavation_info[:white_lined].class).to be(String)
    end

    it "expects presence of locate_instructions" do
      expect(excavation_info[:locate_instructions].class).to be(String)
    end

    it "expects presence of remarks" do
      expect(excavation_info[:remarks].class).to be(String)
    end

    it "expects presence of digside_info" do
      expect(DigsiteInfo.find(excavation_info[:digsite_infos_id])).to be_valid
    end
  end
end
