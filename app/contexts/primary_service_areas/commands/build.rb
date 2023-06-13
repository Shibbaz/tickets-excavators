module Contexts
    module PrimaryServiceAreas
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call
                    PrimaryServiceAreaCode.transaction do
                        entity = PrimaryServiceAreaCode.new(sa_code: @params["SACODE"])
                        entity.save!
                    end
                rescue => e
                    { error: e.message }
                end
            end
        end
    end
end