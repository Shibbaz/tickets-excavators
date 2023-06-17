require "rails_helper"

RSpec.describe Contexts::PrimaryServiceAreas::Commands::Build, type: :model do
  describe ".call" do
    subject {
      described_class.new({
        SACode: "SACode"
      })
    }
    it "is successful" do
      result = subject.call
      expect(result).to be_valid
      expect(result.class).to be(PrimaryServiceAreaCode)
      expect(result.sa_code).to eq("SACode")
    end
  end
end
