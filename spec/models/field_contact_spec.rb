require "rails_helper"

RSpec.describe FieldContact, type: :model do
  context "create method" do
    let(:field_contact) {
      create(:field_contact)
    }
    it "passes validation" do
      expect(field_contact).to be_valid
    end

    it "expects presence of name attribute" do
      expect(field_contact[:name].class).to be(String)
    end

    it "expects presence of phone attribute" do
      expect(field_contact[:phone].class).to be(Integer)
    end

    it "expects presence of email attribute" do
      expect(field_contact[:email].class).to be(String)
    end
  end
end
