require 'faker'

FactoryBot.define do
    factory :digsite_info do
            id { SecureRandom.uuid }
            polygon { "POLYGON ((-74.2503655987721 40.5091442241349, -74.2504120352793 40.5091183000754, -74.2503322759711 40.5090405104492, -74.2503655987721 40.5091442241349 ))" }
            look_up_by { "MANUAL" }
            location_type { "Multiple Address" }
            subdivision { "" }
            adress_info_id { create(:adress_info).id }
            near_streets_id { create(:near_street).id }
            intersections_id { create(:intersection).id }
    end
end