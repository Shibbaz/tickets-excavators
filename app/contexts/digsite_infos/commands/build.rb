module Contexts
    module DigsiteInfos
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call(adress_info_id:, near_street_id:, intersection_id:)
                    DigsiteInfo.transaction do
                        DigsiteInfo.create(
                            id: Faker::Number.number(digits: 8),
                            polygon: @params[:WellKnownText], 
                            look_up_by: @params[:LookUpBy],
                            location_type: @params[:LocationType],
                            subdivision: @params[:SubDivision], 
                            adress_info_id: adress_info_id,
                            near_streets_id: near_street_id,
                            intersections_id: intersection_id
                        )
                    end
                rescue => e
                    { error: e.message }
                end
            end
        end
    end
end
