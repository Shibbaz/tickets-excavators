class ServiceArea < ApplicationRecord
    has_one :primary_service_area_code
    has_one :additional_service_area_code
end
