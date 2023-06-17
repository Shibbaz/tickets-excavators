module Trees
    module ServiceArea
        class Build
            def initialize(params)
                @params = params
            end

            def call
                additional_service_area = Contexts::AdditionalServiceAreas::Commands::Build.new(
                    @params[:AdditionalServiceAreaCodes]
                ).call
                primary_service_area = Contexts::PrimaryServiceAreas::Commands::Build.new(
                    @params[:PrimaryServiceAreaCode]
                ).call
                service_area = Contexts::ServiceAreas::Commands::Build.new.call(
                    primary_service_area_codes_id: primary_service_area.id, 
                    additional_service_area_codes_id: additional_service_area.id
                )
            end
        end
    end
end