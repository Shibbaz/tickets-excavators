class Ticket < ApplicationRecord
    has_one :ticketDate
    has_one :serviceArea
end
