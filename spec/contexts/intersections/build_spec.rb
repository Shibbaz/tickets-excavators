require "rails_helper"

RSpec.describe Contexts::Intersections::Commands::Build, type: :model do
  describe ".call" do
    let(:itoi) {
      create(:itoi)
    }
    subject {
      described_class.new({
        ItoI: [itoi]
      })
    }

    it "is successful" do
      expect(subject.call).to be_valid
    end
  end
end
