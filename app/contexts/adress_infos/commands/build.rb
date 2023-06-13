module Contexts
    module AdressInfos
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call(street_id:, adress_id:)
                    AdressInfo.transaction do
                        entity = AdressInfo.new(
                            state: "ST",
                            county: "COUNTY",
                            place: "PLACE",
                            zip: "",
                            adress_digsite_id: adress_id,
                            street_digsite_id: street_id
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
