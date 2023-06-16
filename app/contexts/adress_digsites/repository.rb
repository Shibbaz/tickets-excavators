module Contexts
    module AdressDigsites
        class Repository
            def initialize(adapter: AdressDigsite)
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
                    AdressNum: object.adress_num
                ]
            end
        end
    end
end