module Contexts
    module Tickets
        module Commands
            class Build
                def call(ticket_dates_id:, service_areas_id:, excavator_id:, excavation_info_id:)
                    Ticket.transaction do
                        Ticket.create(
                            ticket_dates_id: ticket_dates_id,
                            service_areas_id: service_areas_id, 
                            excavator_id: excavator_id,
                            excavation_info_id: excavation_info_id
                        )
                    end
                rescue => e
                    { error: e.message }
                end
            end
        end
    end
end