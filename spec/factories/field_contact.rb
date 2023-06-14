require 'faker'

FactoryBot.define do
    factory :field_contact do
        id { Faker::Number.within(range: 1..1000) }
        name { "Field Contact" }
        phone { "1235557924" }
        email { "example@example.com" }
    end
end