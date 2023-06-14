require 'rails_helper'

RSpec.describe Excavator, type: :model do
  context 'create method' do
    let(:excavator) {
      create(:excavator)
    }

    it 'passes validation' do
      expect(excavator).to be_valid
    end
    
    it 'expects presence of contact' do
      expect(Contact.find(excavator[:contacts_id])).to be_valid
    end

    it 'expects presence of field contact' do
      expect(FieldContact.find(excavator[:field_contacts_id])).to be_valid
    end

    it 'expects presence of company_name attribute' do
      expect(excavator[:company_name].class).to be(String)
    end

    it 'expects presence of address attribute' do
      expect(excavator[:address].class).to be(String)
    end

    it 'expects presence of city attribute' do
      expect(excavator[:city].class).to be(String)
    end

    it 'expects presence of state attribute' do
      expect(excavator[:state].class).to be(String)
    end

    it 'expects presence of zip attribute' do
      expect(excavator[:zip].class).to be(String)
    end

    it 'expects presence of crew_on_site attribute' do
      expect(excavator[:crew_on_site].class).to be(TrueClass)
    end

    it 'expects presence of type attribute' do
      expect(excavator[:type].class).to be(String)
    end
  end
end
