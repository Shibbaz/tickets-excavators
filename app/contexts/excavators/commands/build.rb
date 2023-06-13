module Contexts
    module Excavators
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call(contact_id:, field_contact_id:)
                    Excavator.transaction do
                        entity = Excavator.new(
                            contacts_id: contact_id,
                            field_contacts_id: field_contact_id,
                            company_name: @params[:Company], 
                            address: @params[:Address],
                            city: @params[:City],
                            state: @params[:State],
                            zip: @params[:Zip],
                            crew_on_site: @params[:CrewOnsite],
                            type: @params[:ExcavatorType]
                        )
                        entity = entity.save!
                    end
                rescue => e
                    { error: e.message }
                end
            end
        end
    end
end