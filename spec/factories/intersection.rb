require 'faker'

FactoryBot.define do
    factory :intersection do
        id { Faker::Number.within(range: 1..1000) } 
        itoi_ids { 
            itoi = create(:itoi)
            extra_itoi = Itoi.create(id: Faker::Number.within(range: 1..1000) , state: "ZZ", county: "COUNTY", place: "ATLANTA", prefix: "", name: "Jefferson", dig_type: "Ave", suffix: "SW")
            [itoi.id, extra_itoi.id] 
        }
    end
end