module Trees
    module Excavator
        class Build
            def initialize(params)
                @params = params
            end

            def call
                contact = Contexts::Contacts::Commands::Build.new(@params[:Contact]).call
                field_contact = Contexts::FieldContacts::Commands::Build.new(@params[:FieldContact]).call
                Contexts::Excavators::Commands::Build.new(@params).call(
                    contact_id: contact.id,
                    field_contact_id: field_contact.id
                )
            end
        end
    end
end