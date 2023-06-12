class ServiceArea < ApplicationRecord
    has_one :primaryServiceAreaCode
    has_one :additionalServiceAreaCode
end
