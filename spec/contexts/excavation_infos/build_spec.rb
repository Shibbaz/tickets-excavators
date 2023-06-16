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
      result = subject.call(
        digsite_infos_id: digsite_info.id
      )
      expect(result).to be_valid
      expect(result.class).to be(ExcavationInfo)
      expect(result.type_of_work).to eq("TypeOfWork")
      expect(result.work_done_for).to eq("WorkDoneFor")
      expect(result.project_duration).to eq("ProjectDuration")
      expect(result.project_start_date).to eq("-4712/01/01 00:00:00")
      expect(result.explosives).to eq("Explosives")
      expect(result.under_ground_over_head).to eq("UnderGroundOverhead")
      expect(result.horizontal_boring).to eq("HorizontalBoring")
      expect(result.white_lined).to eq("Whitelined")
      expect(result.locate_instructions).to eq("LocateInstructions")
      expect(result.remarks).to eq("Remarks")
    end
  end
end
