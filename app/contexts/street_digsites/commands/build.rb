module Contexts
    module StreetDigsites
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call
                    StreetDigsite.transaction do
                        StreetDigsite.create(
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