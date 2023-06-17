require "rails_helper"

RSpec.describe Contexts::Intersections::Repository, type: :model do
  context "create method" do
    let(:intersection) {
      create(:intersection)
    }

    subject { described_class.new }

    it "expects to find Intersections by id and return data as hash" do
      data = subject.load(intersection.id)
      expect(data.key?(:ItoI)).to be(true)
    end

    it "expects to fail finding Intersection by id" do
      expect { subject.load("") }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
