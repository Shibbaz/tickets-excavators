require "faker"

FactoryBot.define do
  factory :itoi do
    id { SecureRandom.uuid }
    state { "XX" }
    county { "FULERTON" }
    place { "NORCROSS" }
    prefix { "" }
    name { "London" }
    dig_type { "St" }
    suffix { "SW" }
  end
end
