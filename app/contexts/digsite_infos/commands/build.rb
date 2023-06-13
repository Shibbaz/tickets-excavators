module Contexts
    module DigsiteInfos
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call(adress_info_id:, near_street_id:, intersection_id:)
                    DigsiteInfo.transaction do
                        entity = DigsiteInfo.new(
                            polygon: @params[:WellKnownText], 
                            look_up_by: @params[:LookUpBy],
                            location_type: @params[:Type],
                            subdivision: @params[:Subdivision], 
                            adress_info_id: adress_info_id,
                            near_streets_id: near_street_id,
                            intersections_id: intersection_id
                        )
                        entity.save!
                    end
                rescue => e
                    { error: e.message }
                end
            end
        end
    end
end
