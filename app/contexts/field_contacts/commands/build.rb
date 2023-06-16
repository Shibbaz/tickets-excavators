module Contexts
    module FieldContacts
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call
                    FieldContact.transaction do
                        FieldContact.create( 
                            id: SecureRandom.uuid,
                            name: @params[:Name],
                            phone: @params[:Phone],
                            email: @params[:Email]
                        )
                    end
                rescue => e
                    { error: e.message }
                end
            end
        end
    end
end