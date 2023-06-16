module Contexts
    module ServiceAreas
        class Repository
            def initialize(adapter: ServiceArea)
                @adapter = adapter
            end

            def load(id)
                loader = Dataloader.new do |ids|
                    object = @adapter.find(*ids)
                    self.format(object)
                end
                if id.eql? nil
                    return {}
                end
                promise = loader.load(id)
                promise.sync
            end

            private
            def format(object)
                additionalRepository = ::Contexts::AdditionalServiceAreas::Repository.new
                primaryRepository = ::Contexts::PrimaryServiceAreas::Repository.new
                [
                    PrimaryServiceAreaCode: primaryRepository.load(object.primary_service_area_codes_id),
                    AdditionalServiceAreaCodes: additionalRepository.load(object.additional_service_area_codes_id)
                ]
            end
        end
    end
end
