require 'rails_helper'

RSpec.describe PrimaryServiceAreaCode, type: :model do
  context 'create method' do
    let(:primary_service_area_code) {
      create(:primary_service_area_code)
    }
    it 'passes validation' do
      expect(primary_service_area_code).to be_valid
    end

    it 'expects SA code type to be []string' do
      arrayTypeValidation = ->(sa_code) { sa_code.class.eql? String }
      validation = arrayTypeValidation.call(primary_service_area_code.sa_code)
      expect(validation).to be(true)
    end
  end
end
