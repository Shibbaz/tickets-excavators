require "rails_helper"

RSpec.describe NearStreet, type: :model do
  context "create method" do
    let(:near_street) {
      create(:near_street)
    }
    it "passes validation" do
      expect(near_street).to be_valid
    end

    it "expects presence of state" do
      expect(near_street[:state].class).to be(String)
    end

    it "expects presence of county" do
      expect(near_street[:county].class).to be(String)
    end

    it "expects presence of place" do
      expect(near_street[:place].class).to be(String)
    end

    it "expects presence of prefix" do
      expect(near_street[:prefix].class).to be(String)
    end

    it "expects presence of name" do
      expect(near_street[:name].class).to be(String)
    end

    it "expects presence of dig_type" do
      expect(near_street[:dig_type].class).to be(String)
    end

    it "expects presence of suffix" do
      expect(near_street[:suffix].class).to be(String)
    end
  end
end
