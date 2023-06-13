class Excavator < ApplicationRecord
    has_many :field_contact
    has_one :contact
end
