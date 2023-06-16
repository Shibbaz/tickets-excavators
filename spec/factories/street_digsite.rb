require 'faker'

FactoryBot.define do
    factory :street_digsite do
        id { SecureRandom.uuid }
        prefix { "" }
        name {"Trinity" }
        dig_type { "Ave" }
        suffix { "SW" }
    end
end