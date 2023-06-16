require 'rails_helper'

RSpec.describe Contexts::Contacts::Repository, type: :model do
  context 'create method' do
    let(:contact) { 
      create(:contact)
    }

    subject { described_class.new }

    it 'expects to find Contacts by id and return data as hash' do
      data = subject.load(contact.id)
      expect(data.key? :Name).to be(true)
      expect(data.key? :Phone).to be(true)
      expect(data.key? :Email).to be(true)
      expect(data[:Name]).to eq(contact.name)
      expect(data[:Phone]).to eq(contact.phone)
      expect(data[:Email]).to eq(contact.email)
    end

    it 'expects to fail finding Contact by id' do
      expect { subject.load("") }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
