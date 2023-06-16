require 'rails_helper'

RSpec.describe Contexts::AdressInfos::Repository, type: :model do
  context 'create method' do
    let(:adress_info) { 
      create(:adress_info)
    }

    subject { described_class.new }

    it 'expects to find AdressInfos by id and return data as hash' do
      data = subject.load(adress_info.id)
      expect(data.key? :State).to be(true)
      expect(data.key? :County).to be(true)
      expect(data.key? :Place).to be(true)
      expect(data.key? :Zip).to be(true)
      expect(data.key? :Adress).to be(true)
      expect(data.key? :Street).to be(true)
      expect(data[:State]).to eq(adress_info.state)
      expect(data[:County]).to eq(adress_info.county)
      expect(data[:Place]).to eq(adress_info.place)
      expect(data[:Zip]).to eq(adress_info.zip)
    end

    it 'expects to fail finding AdressInfo by id' do
      expect { subject.load("") }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
