module Contexts
    module StreetDigsites
        class Repository

            def initialize(adapter: StreetDigsite)
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
                    Prefix: object.prefix,
                    Name: object.name,
                    Type: object.dig_type,
                    Suffix: object.suffix
                ]
            end
        end
    end
end