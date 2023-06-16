require "rails_helper"

RSpec.describe Contexts::PrimaryServiceAreas::Commands::Build, type: :model do
  describe ".call" do
    subject {
      described_class.new({
        SACode: "SACode"
      })
    }
    it "is successful" do
      expect(subject.call).to be_valid
    end
  end
end
