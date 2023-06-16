require "faker"

FactoryBot.define do
  factory :service_area do
    id { SecureRandom.uuid }
    primary_service_area_codes_id { create(:primary_service_area_code).id }
    additional_service_area_codes_id { create(:additional_service_area_code).id }
  end
end
