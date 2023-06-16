require "faker"

FactoryBot.define do
  factory :adress_info do
    id { SecureRandom.uuid }
    state { "ST" }
    county { "COUNTY" }
    place { "PLACE" }
    zip { "" }
    adress_digsite_id { create(:adress_digsite).id }
    street_digsite_id { create(:street_digsite).id }
  end
end
