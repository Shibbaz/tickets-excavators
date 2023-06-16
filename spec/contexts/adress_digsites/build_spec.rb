require "rails_helper"

RSpec.describe Contexts::AdressDigsites::Commands::Build, type: :model do
  describe ".call" do
    subject {
      described_class.new({
        AddresNum: ["Adress 1", "Adress 2"]
      })
    }
    it "is successful" do
      expect(subject.call).to be_valid
    end
  end
end
