module Contexts
    module Excavators
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call(contact_id:, field_contact_id:)
                    Excavator.transaction do
                        Excavator.create(
                            id: SecureRandom.uuid,
                            contacts_id: contact_id,
                            field_contacts_id: field_contact_id,
                            company_name: @params[:CompanyName], 
                            address: @params[:Address],
                            city: @params[:City],
                            state: @params[:State],
                            zip: @params[:Zip],
                            crew_on_site: @params[:CrewOnsite],
                            type: @params[:ExcavatorType]
                        )
                    end
                rescue => e
                    { error: e.message }
                end
            end
        end
    end
end