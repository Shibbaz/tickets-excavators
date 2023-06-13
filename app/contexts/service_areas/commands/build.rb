module Contexts
    module ServiceAreas
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call(primary_service_area_codes_id:, additional_service_area_codes_id:)
                    ServiceArea.transaction do
                        entity = ServiceArea.create(
                            primary_service_area_codes_id: primary_service_area_codes_id,
                            additional_service_area_codes_id: additional_service_area_codes_id
                        )
                        entity = entity.save!
                    end
                rescue => e
                    { error: e.message }
                end
            end
        end
    end
end