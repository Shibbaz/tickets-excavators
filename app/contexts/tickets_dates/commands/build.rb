module Contexts
    module TicketsDates
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call
                    response_due_date_time = @params[:ResponseDueDateTime]
                    transmission_date_time = @params[:TransmissionDateTime]
                    legal_date_time = @params[:LegalDateTime]
                    request_taken_date_time = @params[:RequestTakenDateTime]
                    restake_date = @params[:RestakeDate]
                    expiration_date = @params[:ExpirationDate]
                    overhead_begin_date = @params[:OverheadBeginDate]
                    lpm_metting_accept_due_date = @params[:LPMmettingAcceptDueDate]
                    overhead_end_date = @params[:OverheadEndDate]
                    TicketDates.transaction do
                        TicketDates.create(id: Faker::Number.number(digits: 8), 
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
