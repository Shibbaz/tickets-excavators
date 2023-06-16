class ServiceArea < ApplicationRecord
    has_one :primary_service_area_code
    has_one :additional_service_area_code

    
    def primary_service_area
        loader = Dataloader.new do |ids|
            [PrimaryServiceAreaCode.find(*ids)]
        end
        if self.primary_service_area_codes_id.eql? nil
            return {}
        end
        promise = loader.load(self.primary_service_area_codes_id)
        promise.sync
    end

    def additional_service_area
        loader = Dataloader.new do |ids|
            [AdditionalServiceAreaCode.find(*ids)]
        end
        if self.additional_service_area_codes_id.eql? nil
            return {}
        end
        promise = loader.load(self.additional_service_area_codes_id)
        promise.sync
    end
end
