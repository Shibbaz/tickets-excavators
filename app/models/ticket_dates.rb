class TicketDates < ApplicationRecord
    def response_due_date_time
        super.strftime('%Y/%m/%d %H:%M:%S')
    end

    def transmission_date_time
        super.strftime('%Y/%m/%d %H:%M:%S')
    end

    def legal_date_time
        super.strftime('%Y/%m/%d %H:%M:%S')
    end

    def request_taken_date_time
        super.strftime('%Y/%m/%d %H:%M:%S')
    end

    def restake_date
        super.strftime('%Y/%m/%d %H:%M:%S')
    end

    def expiration_date
        super.strftime('%Y/%m/%d %H:%M:%S')
    end

    def lpm_metting_accept_due_date
        super.strftime('%Y/%m/%d %H:%M:%S')
    end

    def overhead_begin_date
        super.strftime('%Y/%m/%d %H:%M:%S')
    end

    def overhead_end_date
        super.strftime('%Y/%m/%d %H:%M:%S')
    end
end
