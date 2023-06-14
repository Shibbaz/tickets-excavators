require 'faker'

FactoryBot.define do
    factory :itoi do
        id { Faker::Number.within(range: 1..1000) }
        state { "XX" }
        county { "FULERTON" }
        place { "NORCROSS" }
        prefix { "" }
        name { "London" }
        dig_type { "St" }
        suffix { "SW" }
    end
end