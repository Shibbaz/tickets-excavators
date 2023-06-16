require "rails_helper"

RSpec.describe Contexts::NearStreets::Commands::Build, type: :model do
  describe ".call" do
    let(:itoi) {
      create(:itoi)
    }
    subject {
      described_class.new({
        State: "State",
        County: "County",
        Place: "Place",
        Prefix: "Prefix",
        Name: "Name",
        Type: "Type",
        Suffix: "Suffix"
      })
    }

    it "is successful" do
      expect(subject.call).to be_valid
    end
  end
end
