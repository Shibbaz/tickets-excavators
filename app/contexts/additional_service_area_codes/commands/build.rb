module Contexts
    module AdditionalServiceAreas
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call
                    AdditionalServiceAreaCode.transaction do
                        AdditionalServiceAreaCode.create(id: Faker::Number.number(digits: 8), sa_code: @params["SACODE"])
                    end
                rescue => e
                    { error: e.message }
                end
            end
        end
    end
end