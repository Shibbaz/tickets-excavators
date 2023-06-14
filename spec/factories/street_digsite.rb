require 'faker'

FactoryBot.define do
    factory :street_digsite do
        id { Faker::Number.within(range: 1..1000) }
        prefix { "" }
        name {"Trinity" }
        dig_type { "Ave" }
        suffix { "SW" }
    end
end