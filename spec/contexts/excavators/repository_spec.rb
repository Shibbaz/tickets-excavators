require 'rails_helper'

RSpec.describe Contexts::Excavators::Repository, type: :model do
  context 'create method' do
    let(:excavator) { 
      create(:excavator)
    }

    it 'expects to find Excavators by id and return data as hash' do
        data = subject.load(excavator.id)
        expect(data.key? :CompanyName).to be(true)
        expect(data.key? :Address).to be(true)
        expect(data.key? :City).to be(true)
        expect(data.key? :State).to be(true)
        expect(data.key? :Zip).to be(true)
        expect(data.key? :CrewOnsite).to be(true)
        expect(data[:CompanyName]).to eq(excavator.company_name)
        expect(data[:Address]).to eq(excavator.address)
        expect(data[:City]).to eq(excavator.city)
        expect(data[:State]).to eq(excavator.state)
        expect(data[:Zip]).to eq(excavator.zip)
        expect(data[:CrewOnsite]).to eq(excavator.crew_on_site)
    end

    it 'expects to fail finding Excavator by id' do
      expect { subject.load("") }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end