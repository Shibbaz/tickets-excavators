module JSONBuilder
    class Ticket
        def self.call(ticket)
            {
                RequestType: ticket.request_type,
                VersionNumber: ticket.version_number,
                RequestNumber: ticket.request_number,
                RequestAction: ticket.request_action,
                DateTimes: ticket.ticket_dates,
                ServiceArea: ::Contexts::ServiceAreas::Repository.new.load(ticket.service_areas_id),
                Excavator: ::Contexts::Excavators::Repository.new.load(ticket.excavator_id),
                ExcavationInfo: ::Contexts::ExcavationDatas::Repository.new.load(ticket.excavation_info_id)
            }
        end
    end
end