require 'faker'

FactoryBot.define do
    factory :additional_service_area_code do
        id { Faker::Number.number(digits: 8) }
        sa_code { ["ZZ0918"] }
    end
end