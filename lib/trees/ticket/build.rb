module Trees
    module Ticket
        class Build
            def initialize(params)
                @params = params
            end
            
            def call
                ticket_dates = Contexts::TicketsDates::Commands::Build.new(@params[:DateTimes]).call
                excavation_info = Trees::ExcavationInfos::Build.new(@params[:ExcavationInfo]).call
                excavator = Trees::Excavator::Build.new(@params[:Excavator]).call
                service_area = Trees::ServiceArea::Build.new(@params[:ServiceArea]).call
                ticket = Contexts::Tickets::Commands::Build.new.call(
                    ticket_dates_id: ticket_dates.id, 
                    service_areas_id: service_area.id, 
                    excavator_id: excavator.id, 
                    excavation_info_id: excavation_info.id
                )
            end
        end
    end
end