module Contexts
    module AdressInfos
        class Repository
            def initialize(adapter: AdressInfo)
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
                    State: object.state,
                    County: object.county,
                    Place: object.place,
                    Zip: object.zip,
                    Adress: Contexts::AdressDigsites::Repository.new.load(object.adress_digsite_id),
                    Street: Contexts::StreetDigsites::Repository.new.load(object.street_digsite_id)
                ]
            end
        end
    end
end