require "rails_helper"

RSpec.describe Contexts::StreetDigsites::Repository, type: :model do
  context "create method" do
    let(:street_digsite) {
      create(:street_digsite)
    }

    it "expects to find StreetDigsites by id and return data as hash" do
      data = subject.load(street_digsite.id)
      expect(data.key?(:Prefix)).to be(true)
      expect(data.key?(:Name)).to be(true)
      expect(data.key?(:Type)).to be(true)
      expect(data.key?(:Suffix)).to be(true)
      expect(data[:Prefix]).to eq(street_digsite.prefix)
      expect(data[:Name]).to eq(street_digsite.name)
      expect(data[:Type]).to eq(street_digsite.dig_type)
      expect(data[:Suffix]).to eq(street_digsite.suffix)
    end

    it "expects to fail finding StreetDigsite by id" do
      expect { subject.load("") }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
