require 'rails_helper'

RSpec.describe StreetDigsite, type: :model do
  context 'create method' do
    let(:street_digsite) {
      create(:street_digsite)
    }
      
    it 'passes validation' do
      expect(street_digsite).to be_valid
    end

    it 'expects presence of prefix attribute' do
      expect(street_digsite[:prefix].class).to be(String)
    end

    it 'expects presence of name attribute' do
      expect(street_digsite[:name].class).to be(String)
    end

    it 'expects presence of dig_type attribute' do
      expect(street_digsite[:dig_type].class).to be(String)
    end

    it 'expects presence of suffix attribute' do
      expect(street_digsite[:suffix].class).to be(String)
    end
  end
end
