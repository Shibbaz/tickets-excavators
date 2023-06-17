require "rails_helper"

RSpec.describe Contexts::FieldContacts::Repository, type: :model do
  context "create method" do
    let(:field_contact) {
      create(:field_contact)
    }

    subject { described_class.new }

    it "expects to find FieldContacts by id and return data as hash" do
      data = subject.load(field_contact.id)
      expect(data.key?(:Name)).to be(true)
      expect(data.key?(:Phone)).to be(true)
      expect(data.key?(:Email)).to be(true)
      expect(data[:Name]).to eq(field_contact.name)
      expect(data[:Phone]).to eq(field_contact.phone)
      expect(data[:Email]).to eq(field_contact.email)
    end

    it "expects to fail finding FieldContact by id" do
      expect { subject.load("") }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
