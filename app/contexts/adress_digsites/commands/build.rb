module Contexts
    module AdressDigsites
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call
                    AdressDigsite.transaction do
                        AdressDigsite.create(adress_num: @params[:AdressNum])
                        adress.save!
                    end
                rescue => e
                    { error: e.message }
                end
            end
        end
    end
end