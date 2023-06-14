FactoryBot.define do
    factory :ticket do
        id { Faker::Number.within(range: 1..1000) }
        ticket_dates_id { create(:ticket_dates).id } 
        service_areas_id { create(:service_area).id }
        excavator_id { create(:excavator).id }
        excavation_info_id { create(:excavation_info).id }
    end
end
