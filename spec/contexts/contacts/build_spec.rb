require "rails_helper"

RSpec.describe Contexts::Contacts::Commands::Build, type: :model do
  describe ".call" do
    subject {
      described_class.new({
        Name: "Name",
        Phone: 666099221,
        Email: "Email"
      })
    }

    it "is successful" do
      result = subject.call
      expect(result).to be_valid
      expect(result.class).to be(Contact)
      expect(result.name).to eq("Name")
      expect(result.phone).to eq(666099221)
      expect(result.email).to eq("Email")
    end
  end
end
