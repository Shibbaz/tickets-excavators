require "faker"

FactoryBot.define do
  factory :near_street do
    id { SecureRandom.uuid }
    state { "XX" }
    county { "SomeCounty" }
    place { "City" }
    prefix { "" }
    name { "" }
    dig_type { "" }
    suffix { "" }
  end
end
