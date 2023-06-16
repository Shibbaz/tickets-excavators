require "rails_helper"

RSpec.describe Contexts::Excavators::Commands::Build, type: :model do
  describe ".call" do
    let(:contact) { create(:contact) }
    let(:field_contact) { create(:field_contact) }

    subject {
      described_class.new({
        CompanyName: "John Doe CONSTRUCTION",
        Address: "555 Some RD",
        City: "SOME PARK",
        State: "ZZ",
        Zip: "55555",
        CrewOnsite: true,
        Type: "Excavator"
      })
    }

    it "is successful" do
      result = subject.call(
        contact_id: contact.id,
        field_contact_id: field_contact.id
      )
      expect(result).to be_valid
      expect(result.class).to be(Excavator)
      expect(result.company_name).to eq("John Doe CONSTRUCTION")
      expect(result.address).to eq("555 Some RD")
      expect(result.city).to eq("SOME PARK")
      expect(result.state).to eq("ZZ")
      expect(result.zip).to eq("55555")
      expect(result.crew_on_site).to eq(true)
      expect(result.type).to eq("Excavator")
    end
  end
end
