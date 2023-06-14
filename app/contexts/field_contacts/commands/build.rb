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
                            id: Faker::Number.number(digits: 8),
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