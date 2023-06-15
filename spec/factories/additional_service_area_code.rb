require 'faker'

FactoryBot.define do
    factory :additional_service_area_code do
        id { SecureRandom.uuid }
        sa_code { ["ZZ0918"] }
    end
end