require "faker"

FactoryBot.define do
  factory :primary_service_area_code do
    id { SecureRandom.uuid }
    sa_code { "ZZ0918" }
  end
end
