class Ticket < ApplicationRecord
    has_one :ticket_date
    has_one :service_area
    has_one :excavator

    def ticket_dates
        loader = Dataloader.new do |ids|
            ticket_dates = TicketDates.find(*ids)
            self.format(ticket_dates)
        end
        if self.ticket_dates_id.eql? nil
            return {}
        end
        promise = loader.load(self.ticket_dates_id)
        promise.sync
    end

    def excavation_info
        loader = Dataloader.new do |ids|
            excavation_infos = ExcavationInfo.find(*ids)
            [excavation_infos]
        end
        if self.excavation_info_id.eql? nil
            return {}
        end
        promise = loader.load(self.excavation_info_id)
        promise.sync
    end

    def service_areas
        loader = Dataloader.new do |ids|
            service_areas = ServiceArea.find(*ids)
            self.format_service_areas(service_areas)
        end
        if self.service_areas_id.eql? nil
            return {}
        end
        promise = loader.load(self.service_areas_id)
        promise.sync
    end

    private

    def format(ticket_dates)
        [
            RequestTakenDateTime: ticket_dates.request_taken_date_time,
            ResponseDueDateTime: ticket_dates.response_due_date_time,
            LegalDateTime: ticket_dates.legal_date_time,
            RestakeDate: ticket_dates.restake_date,
            ExpirationDate: ticket_dates.expiration_date,
            LPMmettingAcceptDueDate: ticket_dates.lpm_metting_accept_due_date,
            OverheadBeginDate: ticket_dates.overhead_begin_date,
            OverheadEndDate: ticket_dates.overhead_end_date,
            TransmissionDateTime: ticket_dates.transmission_date_time
        ]
    end

    def format_service_areas(service_areas)
        [
            PrimaryServiceAreaCode: service_areas.primary_service_area,
            AdditionalServiceAreaCodes: service_areas.additional_service_area
        ]
    end
end
