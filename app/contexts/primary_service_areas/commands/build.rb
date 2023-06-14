module Contexts
    module PrimaryServiceAreas
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call
                    PrimaryServiceAreaCode.transaction do
                        PrimaryServiceAreaCode.create(id: Faker::Number.number(digits: 8), sa_code: @params["SACODE"])
                    end
                rescue => e
                    { error: e.message }
                end
            end
        end
    end
end