require 'rails_helper'

RSpec.describe AdressInfo, type: :model do
  context 'create method' do
    let(:adress_info) {
      create(:adress_info)
    }
    it 'passes validation' do
      expect(adress_info).to be_valid
    end

    it 'expects presence of state attribute' do
      expect(adress_info[:state].class).to eq(String)
    end

    it 'expects presence of county attribute' do
      expect(adress_info[:county].class).to eq(String)
    end

    it 'expects presence of place attribute' do
      expect(adress_info[:place].class).to eq(String)
    end

    it 'expects presence of zip attribute' do
      expect(adress_info[:zip].class).to eq(String)
    end

    it 'expects presence of street attribute' do
      expect(StreetDigsite.find(adress_info[:street_digsite_id])).to be_valid
    end

    it 'expects expects presence of adress_digsite attribute' do
      expect(AdressDigsite.find(adress_info[:adress_digsite_id])).to be_valid
    end
  end
end
