require "rails_helper"

RSpec.describe Contexts::AdressDigsites::Commands::Build, type: :model do
  describe ".call" do
    subject {
      described_class.new({
        AddressNum: ["Adress 1", "Adress 2"]
      })
    }
    it "is successful" do
      result = subject.call
      expect(result).to be_valid
      expect(result.class).to be(AdressDigsite)
      expect(result.adress_num).to eq(["Adress 1", "Adress 2"])
    end
  end
end
