module Contexts
    module AdditionalServiceAreas
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call
                    AdditionalServiceAreaCode.transaction do
                        AdditionalServiceAreaCode.create(id: SecureRandom.uuid, sa_code: @params[:SACode])
                    end
                rescue => e
                    { error: e.message }
                end
            end
        end
    end
end