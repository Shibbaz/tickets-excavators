require 'faker'

FactoryBot.define do
    factory :ticket_dates do
        id { SecureRandom.uuid }
        response_due_date_time { DateTime.new }
        transmission_date_time { DateTime.new }
        legal_date_time { DateTime.new }
        request_taken_date_time { DateTime.new }
        restake_date { DateTime.new }
        expiration_date { DateTime.new }
        lpm_metting_accept_due_date { DateTime.new }
        overhead_begin_date { DateTime.new }
        overhead_end_date { DateTime.new }
    end
end