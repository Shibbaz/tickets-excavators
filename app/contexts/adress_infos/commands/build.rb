module Contexts
    module AdressInfos
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call(street_id:, adress_id:)
                    AdressInfo.transaction do
                        entity = AdressInfo.create(id: Faker::Number.number(digits: 8), 
                            state: @params[:State],
                            county: @params[:County],
                            place: @params[:Place],
                            zip: @params[:Zip],
                            adress_digsite_id: adress_id,
                            street_digsite_id: street_id
                        )
                    end
                rescue => e
                    { error: e.message }
                end
            end
        end
    end
end
