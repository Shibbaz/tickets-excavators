module Contexts
    module AdditionalServiceAreaBuild
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call
                    AdditionalServiceAreaCode.transaction do
                        entity = AdditionalServiceAreaCode.new(sa_code: @params["SACODE"])
                        entity.save!
                    end
                rescue => e
                    { error: e.message }
                end
            end
        end
    end
end