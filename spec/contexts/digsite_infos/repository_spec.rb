require "rails_helper"

RSpec.describe Contexts::DigsiteInfos::Repository, type: :model do
  context "create method" do
    let(:digsite_info) {
      create(:digsite_info)
    }

    subject { described_class.new }

    it "expects to find DigSiteInfos by id and return data as hash" do
      data = subject.load(digsite_info.id)
      expect(data.key?(:LookUpBy)).to be(true)
      expect(data.key?(:LocationType)).to be(true)
      expect(data.key?(:SubDivision)).to be(true)
      expect(data.key?(:AddressInfo)).to be(true)
      expect(data.key?(:NearStreet)).to be(true)
      expect(data.key?(:Intersection)).to be(true)
      expect(data.key?(:WellKnownText)).to be(true)
      expect(data[:LookUpBy]).to eq(digsite_info.look_up_by)
      expect(data[:LocationType]).to eq(digsite_info.location_type)
      expect(data[:SubDivision]).to eq(digsite_info.subdivision)
      expect(data[:WellKnownText]).to eq(digsite_info.polygon)
    end

    it "expects to fail finding DigsiteInfo by id" do
      expect { subject.load("") }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
