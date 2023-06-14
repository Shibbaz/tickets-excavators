require 'faker'

FactoryBot.define do
    factory :primary_service_area_code do
        id { Faker::Number.within(range: 1..1000) }
        sa_code { "ZZ0918" }
    end
end