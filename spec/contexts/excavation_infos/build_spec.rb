require "rails_helper"

RSpec.describe Contexts::ExcavationDatas::Commands::Build, type: :model do
  describe ".call" do
    let(:digsite_info) {
      create(:digsite_info)
    }

    subject {
      described_class.new({
        TypeOfWork: "TypeOfWork",
        WorkDoneFor: "WorkDoneFor",
        ProjectDuration: "ProjectDuration",
        ProjectStartDate: "-4712/01/01 00:00:00",
        Explosives: "Explosives",
        UnderGroundOverhead: "UnderGroundOverhead",
        HorizontalBoring: "HorizontalBoring",
        Whitelined: "Whitelined",
        LocateInstructions: "LocateInstructions",
        Remarks: "Remarks"
      })
    }

    it "is successful" do
      expect(subject.call(
        digsite_infos_id: digsite_info.id
      )).to be_valid
    end
  end
end
