module Contexts
    module PrimaryServiceAreaCodes
        class Repository
            def initialize(adapter: PrimaryServiceAreaCode)
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
                    SACode: object.sa_code
                ]
            end
        end
    end
end