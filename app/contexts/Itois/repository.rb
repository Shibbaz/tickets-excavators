module Contexts
    module Itois
        class Repository
            def initialize(adapter: Itoi)
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
                [object.map{|element|
                    {
                        State: element.state,
                        County: element.county,
                        Place: element.place,
                        Prefix: element.prefix,
                        Name: element.name,
                        Type: element.dig_type,
                        Suffix: element.suffix
                    }
                }]
            end
        end
    end
end