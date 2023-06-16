require "rails_helper"

RSpec.describe Contexts::AdressDigsites::Repository, type: :model do
  context "create method" do
    let(:adress_digsite) {
      create(:adress_digsite)
    }

    subject { described_class.new }

    it "expects to find AdressDigsite by id and return data as hash" do
      data = subject.load(adress_digsite.id)
      expect(data.key?(:AdressNum)).to be(true)
      expect(data[:AdressNum]).to eq(adress_digsite.adress_num)
    end

    it "expects to fail finding AdressDigsite by id" do
      expect { subject.load("") }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
