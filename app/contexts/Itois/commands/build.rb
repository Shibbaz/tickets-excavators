module Contexts
    module Itois
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call
                    Itoi.transaction do
                        Itoi.create(
                            state: @params[:State],
                            county: @params[:County],
                            place: @params[:Place],
                            prefix: @params[:Prefix],
                            name: @params[:Name],
                            dig_type: @params[:Type],
                            suffix: @params[:Suffix]
                        )
                    end
                rescue => e
                    { error: e.message }
                end
            end
        end
    end
end
