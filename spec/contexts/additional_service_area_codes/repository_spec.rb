require 'rails_helper'

RSpec.describe Contexts::AdditionalServiceAreas::Repository, type: :model do
  context 'create method' do
    let(:additional_service_area) { 
      create(:additional_service_area_code)
    }

    subject { described_class.new }

    it 'expects to find AdditionalServiceArea by id and return data as hash' do
      data = subject.load(additional_service_area.id)
      expect(data.key? :SACode).to be(true)
      expect(data[:SACode]).to eq(additional_service_area.sa_code)
    end

    it 'expects to fail finding AdditionalServiceArea by id' do
      expect { subject.load("") }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
