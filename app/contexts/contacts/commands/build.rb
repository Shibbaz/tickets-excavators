module Contexts
    module Contacts
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call
                    Contact.transaction do
                        entity = Contact.new(name: @params[:Name], phone: @params[:Phone], email: @params[:Email])
                        entity.save!
                    end
                rescue => e
                    { error: e.message }
                end
            end
        end
    end
end
