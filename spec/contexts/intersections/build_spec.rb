require "rails_helper"

RSpec.describe Contexts::Intersections::Commands::Build, type: :model do
  describe ".call" do
    subject {
      described_class.new({
        ItoI: [{
            State: "Victoria",
            County: "Bourke, Evelyn, Grant, Mornington",
            Place: "Melbourne",
            Prefix: "",
            Name: "Melbourne",
            Type: "St",
            Suffix: "SW"
        }]
      })
    }

    it "is successful" do
      result = subject.call
      expect(result).to be_valid
      expect(result.class).to be(Intersection)
      expect(result.itoi_ids).to eq([Itoi.first.id])
    end
  end
end
