module Contexts
    module FieldContacts
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call
                    FieldContact.transaction do
                        entity = FieldContact.new( 
                            name: @params[:Name],
                            phone: @params[:Phone],
                            email: @params[:Email]
                        )
                        entity.save!
                    end
                rescue => e
                    { error: e.message }
                end
            end
        end
    end
end