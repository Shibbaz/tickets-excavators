module Contexts
    module DigsiteInfos
        class Repository
            def initialize(adapter: DigsiteInfo)
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
                [
                    LookUpBy: object.look_up_by,
                    LocationType: object.location_type,
                    SubDivision: object.subdivision,
                    AddressInfo: ::Contexts::AdressInfos::Repository.new.load(object.adress_info_id),
                    NearStreet: ::Contexts::NearStreets::Repository.new.load(object.near_streets_id),
                    Intersection: ::Contexts::Intersections::Repository.new.load(object.intersections_id),
                    WellKnownText: object.polygon
                ]
            end
        end
    end
end