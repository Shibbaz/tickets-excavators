module Contexts
    module Contacts
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call
                    Contact.transaction do
                        Contact.create(name: @params[:Name], phone: @params[:Phone], email: @params[:Email])
                    end
                rescue => e
                    { error: e.message }
                end
            end
        end
    end
end
