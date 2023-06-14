require 'faker'

FactoryBot.define do
    factory :contact do
        id { Faker::Number.within(range: 1..1000) }
        name { "John Doe" }
        phone { "1115552345" }
        email { "example@example.com" }
    end
end