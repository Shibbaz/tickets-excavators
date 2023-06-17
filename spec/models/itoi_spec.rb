require "rails_helper"

RSpec.describe Itoi, type: :model do
  context "create method" do
    let(:itoi) {
      create(:itoi)
    }

    it "passes validation" do
      expect(itoi).to be_valid
    end

    it "expects presence of state" do
      expect(itoi[:state].class).to be(String)
    end

    it "expects presence of county" do
      expect(itoi[:county].class).to be(String)
    end

    it "expects presence of place" do
      expect(itoi[:place].class).to be(String)
    end

    it "expects presence of prefix" do
      expect(itoi[:prefix].class).to be(String)
    end

    it "expects presence of name" do
      expect(itoi[:name].class).to be(String)
    end

    it "expects presence of dig_type" do
      expect(itoi[:dig_type].class).to be(String)
    end

    it "expects presence of suffix" do
      expect(itoi[:suffix].class).to be(String)
    end
  end
end
