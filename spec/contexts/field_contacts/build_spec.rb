require "rails_helper"

RSpec.describe Contexts::FieldContacts::Commands::Build, type: :model do
  describe ".call" do
    subject {
      described_class.new({
        Name: "Name",
        Phone: "Phone",
        Email: "Email"
      })
    }

    it "is successful" do
      expect(subject.call).to be_valid
    end
  end
end
