module Contexts
    module PrimaryServiceAreas
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call
                    PrimaryServiceAreaCode.transaction do
                        PrimaryServiceAreaCode.create(id: SecureRandom.uuid, sa_code: @params[:SACode])
                    end
                rescue => e
                    { error: e.message }
                end
            end
        end
    end
end