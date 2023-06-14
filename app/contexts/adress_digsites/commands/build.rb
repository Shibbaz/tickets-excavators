module Contexts
    module AdressDigsites
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call
                    AdressDigsite.transaction do
                        AdressDigsite.create(id: Faker::Number.number(digits: 8), adress_num: @params[:AdressNum])
                    end
                rescue => e
                    { error: e.message }
                end
            end
        end
    end
end