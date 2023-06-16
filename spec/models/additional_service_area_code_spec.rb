require 'rails_helper'

RSpec.describe AdditionalServiceAreaCode, type: :model do
  context 'create method' do
    let(:additional_service_area) { 
      create(:additional_service_area_code)
    }
    it 'passes validation' do
      expect(additional_service_area).to be_valid
    end

    it 'expects SA code type to be []string' do
      value = false
      arrayTypeValidation = ->(sa_code) { sa_code.each{|obj| value = expect(obj.class).to be(String)} }
      arrayTypeValidation.call(additional_service_area.sa_code)
      expect(additional_service_area.sa_code.class).to be(Array)
      expect(value).to be(true)
    end
  end
end
