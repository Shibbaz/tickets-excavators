module Contexts
    module TicketDates
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call
                    response_due_date_time = new Date(@params["ResponseDueDateTime"])
                    transmission_date_time = new Date(@params["TransmissionDateTime"])
                    legal_date_time = new Date(@params["LegalDateTime"])
                    request_taken_date_time = new Date(@params["RequestTakenDateTime"])
                    restake_date = new Date(@params["RestakeDate"])
                    expiration_date = new Date(@params["ExpirationDate"])
                    overhead_begin_date = new Date(@params["OverheadBeginDate"])
                    lpm_metting_accept_due_date = new Date(@params["LPMeetingAcceptDueDate"])
                    overhead_end_date = new Date(@params["OverheadEndDate"])
                    TicketDates.transaction do
                        TicketDates.create(
                            response_due_date_time: response_due_date_time, 
                            transmission_date_time: transmission_date_time,
                            legal_date_time: legal_date_time,
                            request_taken_date_time: request_taken_date_time,
                            restake_date: restake_date,
                            expiration_date: expiration_date,
                            lpm_metting_accept_due_date: lpm_metting_accept_due_date,
                            overhead_begin_date: overhead_begin_date,
                            overhead_end_date: overhead_end_date
                        )
                    end
                rescue => e
                    { error: e.message }
                end
            end
        end
    end
end
