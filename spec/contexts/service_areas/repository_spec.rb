require "rails_helper"

RSpec.describe Contexts::ServiceAreas::Repository, type: :model do
  context "create method" do
    let(:service_area) {
      create(:service_area)
    }

    subject { described_class.new }

    it "expects to find ServiceAreas by id and return data as hash" do
      data = subject.load(service_area.id)
      expect(data.key?(:PrimaryServiceAreaCode)).to be(true)
      expect(data.key?(:AdditionalServiceAreaCodes)).to be(true)
    end

    it "expects to fail finding ServiceArea by id" do
      expect { subject.load("") }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
