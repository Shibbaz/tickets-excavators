require 'faker'

FactoryBot.define do
    factory :field_contact do
        id { SecureRandom.uuid }
        name { "Field Contact" }
        phone { "1235557924" }
        email { "example@example.com" }
    end
end