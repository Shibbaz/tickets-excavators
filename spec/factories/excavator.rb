require 'faker'

FactoryBot.define do
    factory :excavator do
        id { SecureRandom.uuid }
        contacts_id { create(:contact).id }
        field_contacts_id { create(:field_contact).id }
        company_name { "John Doe CONSTRUCTION" }
        address { "555 Some RD" }
        city { "SOME PARK" }
        state { "ZZ" }
        zip { "55555" }
        crew_on_site { true }
        type { "Excavator" }    
    end
end