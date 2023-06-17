require "rails_helper"

RSpec.describe Contexts::ExcavationDatas::Repository, type: :model do
  context "create method" do
    let(:excavation_info) {
      create(:excavation_info)
    }

    it "expects to find ExcavationDatas by id and return data as hash" do
      data = subject.load(excavation_info.id)
      expect(data.key?(:TypeOfWork)).to be(true)
      expect(data.key?(:WorkDoneFor)).to be(true)
      expect(data.key?(:ProjectDuration)).to be(true)
      expect(data.key?(:ProjectStartDate)).to be(true)
      expect(data.key?(:Explosives)).to be(true)
      expect(data.key?(:UnderGroundOverhead)).to be(true)
      expect(data.key?(:HorizontalBoring)).to be(true)
      expect(data.key?(:Whitelined)).to be(true)
      expect(data.key?(:LocateInstructions)).to be(true)
      expect(data.key?(:Remarks)).to be(true)
      expect(data.key?(:DigsiteInfo)).to be(true)
      expect(data[:TypeOfWork]).to eq(excavation_info.type_of_work)
      expect(data[:WorkDoneFor]).to eq(excavation_info.work_done_for)
      expect(data[:ProjectDuration]).to eq(excavation_info.project_duration)
      expect(data[:ProjectStartDate]).to eq(excavation_info.project_start_date)
      expect(data[:Explosives]).to eq(excavation_info.explosives)
      expect(data[:UnderGroundOverhead]).to eq(excavation_info.under_ground_over_head)
      expect(data[:HorizontalBoring]).to eq(excavation_info.horizontal_boring)
      expect(data[:Whitelined]).to eq(excavation_info.white_lined)
      expect(data[:LocateInstructions]).to eq(excavation_info.locate_instructions)
      expect(data[:Remarks]).to eq(excavation_info.remarks)
    end

    it "expects to fail finding ExcavationInfo by id" do
      expect { subject.load("") }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
