require 'faker'

FactoryBot.define do
    factory :near_street do
        id { Faker::Number.within(range: 1..1000) }
        state { "XX" }
        county { "SomeCounty" }
        place { "City" }
        prefix { "" }
        name { "" }
        dig_type { "" }
        suffix { "" }
    end
end