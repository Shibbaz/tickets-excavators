require "rails_helper"

RSpec.describe Contexts::NearStreets::Repository, type: :model do
  context "create method" do
    let(:near_street) {
      create(:near_street)
    }

    subject { described_class.new }

    it "expects to find NearStreets by id and return data as hash" do
      data = subject.load(near_street.id)

      expect(data.key?(:State)).to be(true)
      expect(data.key?(:County)).to be(true)
      expect(data.key?(:Place)).to be(true)
      expect(data.key?(:Prefix)).to be(true)
      expect(data.key?(:Name)).to be(true)
      expect(data.key?(:Type)).to be(true)
      expect(data.key?(:Suffix)).to be(true)
      expect(data[:State]).to eq(near_street.state)
      expect(data[:County]).to eq(near_street.county)
      expect(data[:Place]).to eq(near_street.place)
      expect(data[:Prefix]).to eq(near_street.prefix)
      expect(data[:Name]).to eq(near_street.name)
      expect(data[:Type]).to eq(near_street.dig_type)
      expect(data[:Suffix]).to eq(near_street.suffix)
    end

    it "expects to fail find AdressDigsite by id" do
      expect { subject.load("") }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
