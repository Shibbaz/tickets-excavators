require 'faker'

FactoryBot.define do
    factory :adress_digsite do
        id { Faker::Number.within(range: 1..1000) }
        adress_num { ["Adress 1", "Adress 2"] }
    end
end