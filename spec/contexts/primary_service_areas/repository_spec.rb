require 'rails_helper'

RSpec.describe Contexts::PrimaryServiceAreas::Repository, type: :model do
  context 'create method' do
    let(:primary_service_area_code) { 
      create(:primary_service_area_code)
    }

    subject { described_class.new }

    it 'expects to find PrimaryServiceArea by id and return data as hash' do
      data = subject.load(primary_service_area_code.id)
      expect(data.key? :SACode).to be(true)
      expect(data[:SACode]).to eq(primary_service_area_code.sa_code)
    end

    it 'expects to fail finding AdressDigsite by id' do
      expect { subject.load("") }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
