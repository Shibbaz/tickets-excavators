module Contexts
    module ServiceAreas
        module Commands
            class Build
                def call(primary_service_area_codes_id:, additional_service_area_codes_id:)
                    ServiceArea.transaction do
                        ServiceArea.create(id: Faker::Number.number(digits: 8), 
                            primary_service_area_codes_id: primary_service_area_codes_id,
                            additional_service_area_codes_id: additional_service_area_codes_id
                        )
                    end
                rescue => e
                    { error: e.message }
                end
            end
        end
    end
end