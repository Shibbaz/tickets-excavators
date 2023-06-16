require 'rails_helper'

RSpec.describe Contact, type: :model do
  context 'create method' do
    let(:contact) {
      create(:contact)
    }
    
    it 'passes validation' do
      expect(contact).to be_valid
    end

    it 'expects presence of name attribute' do
      expect(contact[:name].class).to be(String)
    end

    it 'expects presence of phone attribute' do
      expect(contact[:phone].class).to be(Integer)
    end

    it 'expects presence of email attribute' do
      expect(contact[:email].class).to be(String)
    end
  end
end
