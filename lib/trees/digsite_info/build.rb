module Trees
    module DigsiteInfo
        class Build
            def initialize(params)
                @params = params
            end

            def call
                adress_info = Trees::AdressInfo::Build.new(@params[:AddressInfo]).call
                near_street = Contexts::NearStreets::Commands::Build.new(@params[:NearStreet]).call
                intersection = Contexts::Intersections::Commands::Build.new(@params[:Intersection]).call
                Contexts::DigsiteInfos::Commands::Build.new(@params).call(
                    adress_info_id: adress_info.id, 
                    near_street_id: near_street.id, 
                    intersection_id: intersection.id
                )
            end
        end
    end
end